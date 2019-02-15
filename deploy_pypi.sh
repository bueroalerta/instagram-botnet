set -ex
cd `dirname ${BASH_SOURCE[0]}`

test -f ./VERSION || (echo "file VERSION containing current version is needed" && exit 1)

git pull

rm -rf *.egg-info
rm -rf dist

python3 setup.py sdist

python3 -m twine upload  dist/*

docker run --rm -v "$PWD":/app treeder/bump patch

git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
