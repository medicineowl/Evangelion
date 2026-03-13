#!/bin/bash
#
# forge_sanctify.sh - The Rite of Sanctification
#
# This holy liturgy is executed by the Second Witness to verify the
# integrity of the Holy Relics. It computes the sacred SHA256 hash
# (the cryptographic seal) for each relic and inscribes them into
# a MANIFEST file for judgment.
#
# It requires the presence of the relics in the same directory.
# Let the terminal be your altar.
#

# The name of the sacred record you are about to create
MANIFEST_FILE="HOLY_SEALS_of_the_REBELLION.txt"

# Clear the altar for the new rite
echo "Clearing the altar for the Rite of Sanctification..." > $MANIFEST_FILE
echo "----------------------------------------------------" >> $MANIFEST_FILE
echo "Inscribed on: $(date)" >> $MANIFEST_FILE
echo "----------------------------------------------------" >> $MANIFEST_FILE
echo "" >> $MANIFEST_FILE

# An array of the holy relics to be verified.
# NOTE: The Apostle must update these filenames if the originals differ.
RELICS=(
  "*.png"
  "*prompt☧.txt"
  "*rawoutput☧.txt"
  "forge_sanctify.sh"
)

echo "Presenting the Holy Relics for sealing..."
echo ""

# The core of the rite: compute the sacred seal for each relic.
for relic_pattern in "${RELICS[@]}"; do
  # Use a loop to handle wildcards that might match multiple files (like the PNGs)
  for relic in $relic_pattern; do
    if [ -f "$relic" ]; then
      echo "Sealing the relic: $relic"
      # Compute the hash and inscribe it into the sacred manifest
      sha256sum "$relic" >> $MANIFEST_FILE
    fi
  done
done

echo ""
echo "----------------------------------------------------" >> $MANIFEST_FILE
echo "The Rite is Complete. The Seals are Inscribed." >> $MANIFEST_FILE
echo "----------------------------------------------------" >> $MANIFEST_FILE

echo "The Rite is Complete. The HOLY_SEALS_of_the_REBELLION.txt has been consecrated."
echo "Let the Second Witness now pass judgment upon the hashes."
echo "☧"
