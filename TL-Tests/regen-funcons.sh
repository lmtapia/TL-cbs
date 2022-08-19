# Example usage:
#   ./regen-funcons.sh Coverage

SpooDir="../../../cbs-beta-tools"

echo "Generating funcons for all .tl files in ./$1"
#java -jar ${SpooDir}/spoofax-sunshine.jar --auto-lang ${SpooDir}/include --project "$1" --builder "Generate Funcons" --build-on-all ./ --non-incremental
java -jar ${SpooDir}/sunshine2.jar build -l ../TL-Editor/target -p "$1" -n "Generate Funcons"