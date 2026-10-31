#!/bin/sh
# scaffold.sh — Zero-dependency scaffolding for OpenSDD SpecSets and phases
#
# Usage:
#   scaffold.sh specset <SpecSetName>       # Create a new SpecSet from constitution templates
#   scaffold.sh phase <SpecSetName> <N> <slug>  # Create a new phase dir from phase templates
#   scaffold.sh --help                      # Show usage
#
# Philosophy: copies templates verbatim; humans/AI fill the content afterward.
# Fails loudly (non-zero exit + clear message) when anything is missing.

set -eu

# Resolve paths relative to this script's location, so it works from any CWD
SCRIPT_DIR="$(dirname "$0")"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TEMPLATES_DIR="$PROJECT_ROOT/sdd/templates"
SPEC_ROOT="$PROJECT_ROOT/specs"

# --- Helper functions ---

usage() {
  echo "Usage: $0 specset <SpecSetName>"
  echo "       $0 phase <SpecSetName> <N> <slug>"
  echo ""
  echo "Commands:"
  echo "  specset <SpecSetName>   Create a new SpecSet from constitution templates"
  echo "  phase <SpecSetName> <N> <slug>  Create a new phase dir from phase templates"
  echo ""
  echo "Environment:"
  echo "  TEMPLATES_DIR   Override templates directory (relative to script location)"
  echo "  SPEC_ROOT       Override specs root directory (relative to script location)"
  exit 1
}

# Verify that required templates exist; exit non-zero with message if not
verify_templates() {
  local missing=0
  if [ ! -f "$TEMPLATES_DIR/mission.template.md" ]; then
    echo "Error: Missing template $TEMPLATES_DIR/mission.template.md" >&2
    missing=1
  fi
  if [ ! -f "$TEMPLATES_DIR/tech-stack.template.md" ]; then
    echo "Error: Missing template $TEMPLATES_DIR/tech-stack.template.md" >&2
    missing=1
  fi
  if [ ! -f "$TEMPLATES_DIR/roadmap.template.md" ]; then
    echo "Error: Missing template $TEMPLATES_DIR/roadmap.template.md" >&2
    missing=1
  fi
  if [ ! -f "$TEMPLATES_DIR/requirements.template.md" ]; then
    echo "Error: Missing template $TEMPLATES_DIR/requirements.template.md" >&2
    missing=1
  fi
  if [ ! -f "$TEMPLATES_DIR/plan.template.md" ]; then
    echo "Error: Missing template $TEMPLATES_DIR/plan.template.md" >&2
    missing=1
  fi
  if [ ! -f "$TEMPLATES_DIR/validation.template.md" ]; then
    echo "Error: Missing template $TEMPLATES_DIR/validation.template.md" >&2
    missing=1
  fi
  return $missing
}

# --- Command: specset ---

cmd_specset() {
  local specset_name

  # If a name argument was provided, use it; otherwise prompt interactively
  if [ $# -ge 1 ]; then
    specset_name="$1"
  else
    # Interactive prompt — read from stdin; if stdin is not a terminal, fail loudly
    if [ ! -t 0 ]; then
      echo "Error: specset name required. Usage: $0 specset <SpecSetName>" >&2
      exit 1
    fi
    echo -n "SpecSet name: " >&2
    read -r specset_name
  fi

  # Validate name: non-empty, no spaces
  if [ -z "$specset_name" ]; then
    echo "Error: SpecSet name must be non-empty." >&2
    exit 1
  fi
  if [ "$specset_name" = " "$ ] || echo "$specset_name" | grep -q ' '; then
    echo "Error: SpecSet name must not contain spaces." >&2
    exit 1
  fi

  # Verify templates exist
  if ! verify_templates; then
    exit 1
  fi

  # Create the SpecSet directory
  local target_dir="$SPEC_ROOT/$specset_name"
  if [ -d "$target_dir" ]; then
    echo "Error: SpecSet directory '$target_dir' already exists. Remove or rename it first." >&2
    exit 2
  fi

  mkdir -p "$target_dir"

  # Copy constitution templates (dropping .template suffix)
  cp "$TEMPLATES_DIR/mission.template.md" "$target_dir/mission.md"
  cp "$TEMPLATES_DIR/tech-stack.template.md" "$target_dir/tech-stack.md"
  cp "$TEMPLATES_DIR/roadmap.template.md" "$target_dir/roadmap.md"

  # Print closing hint
  echo "SpecSet '$specset_name' created successfully."
  echo "Now fill the placeholders in the new files — see sdd/02-constitution.md for guidance."
}

# --- Command: phase ---

cmd_phase() {
  local specset_name phase_number slug target_dir date

  # Validate args: need exactly 3 arguments (SpecSetName, N, slug)
  if [ $# -lt 3 ]; then
    echo "Error: 'phase' command requires 3 arguments: SpecSetName N slug" >&2
    echo "Usage: $0 phase <SpecSetName> <N> <slug>" >&2
    exit 1
  fi

  specset_name="$1"
  phase_number="$2"
  slug="$3"

  # Validate phase number: must be numeric
  if ! echo "$phase_number" | grep -qE '^[0-9]+$'; then
    echo "Error: Phase number must be numeric." >&2
    exit 1
  fi

  # Validate slug: kebab-safe (alphanumeric + hyphens, no spaces)
  if echo "$slug" | grep -q ' '; then
    echo "Error: Slug must not contain spaces." >&2
    exit 1
  fi
  if echo "$slug" | grep -qE '[^a-zA-Z0-9-]'; then
    echo "Error: Slug must be kebab-case (alphanumeric + hyphens only)." >&2
    exit 1
  fi

  # Check that the SpecSet exists
  local specset_dir="$SPEC_ROOT/$specset_name"
  if [ ! -d "$specset_dir" ]; then
    echo "Error: SpecSet directory '$specset_dir' does not exist. Create it first with 'scaffold.sh specset <SpecSetName>.'" >&2
    exit 1
  fi

  # Generate date from system clock
  date="$(date +%Y-%m-%d)"

  # Compute target directory name
  target_dir="$specset_dir/$date-$phase_number-$slug"

  # Refuse if target directory already exists
  if [ -d "$target_dir" ]; then
    echo "Error: Target directory '$target_dir' already exists. Remove or rename it first." >&2
    exit 2
  fi

  # Verify templates exist
  if ! verify_templates; then
    exit 1
  fi

  # Create the phase directory
  mkdir -p "$target_dir"

  # Copy phase templates (dropping .template suffix)
  cp "$TEMPLATES_DIR/requirements.template.md" "$target_dir/requirements.md"
  cp "$TEMPLATES_DIR/plan.template.md" "$target_dir/plan.md"
  cp "$TEMPLATES_DIR/validation.template.md" "$target_dir/validation.md"

  # Print closing hint
  echo "Phase directory '$target_dir' created successfully."
  echo "Now fill the placeholders in the new files — see sdd/03-phase-specs.md for guidance."
}

# --- Main argument dispatch ---

# If no arguments or --help, show usage
if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  usage
fi

# Dispatch based on first argument
case "$1" in
  specset)
    cmd_specset "${@:2}"
    ;;
  phase)
    cmd_phase "${@:2}"
    ;;
  *)
    echo "Error: Unknown command '$1'. Use '$0 --help' for usage." >&2
    exit 1
    ;;
esac