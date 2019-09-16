var fs = require('fs');
var input = chomp(fileRead('input.txt')).split('\n');
var claims = input.map(parseClaim);
var claimedFabric = mapCoordinates(claims);
var overlaps = findOverlaps(claimedFabric);
var wantedClaim = findClaimWithoutOverlaps(claims, claimedFabric);

console.log(overlaps.length); // 118223
console.log(wantedClaim.id); // 412

//-----------------------------------------------------------------------------

function fileRead(filename) {
  var contents = fs.readFileSync(filename);
  return contents.toString();
}

function chomp(text) {
  return text.replace(/(\n)+$/, '');
}

function parseClaim(string) {
  var data = string.match(/\d+/g).map(Number);

  return {
    id: data.shift(),
    coordinates: getCoordinates(...data),
  };
}

function getCoordinates(x, y, width, height) {
  var xCoordinates = getAxisPoints(x, width);
  var yCoordinates = getAxisPoints(y, height);

  return product(xCoordinates, yCoordinates);
}

function getAxisPoints(start, length) {
  var axisPoints = [];

  for (let i = start + 1; i <= start + length; i += 1) {
    axisPoints.push(i);
  }

  return axisPoints;
}

function product(xCoordinates, yCoordinates) {
  var coordinates = [];

  xCoordinates.forEach((x) => {
    yCoordinates.forEach((y) => {
      coordinates.push([x, y]);
    });
  });

  return coordinates;
}

function mapCoordinates(claims) {
  var fabric = {};

  claims.forEach((claim) => {
    claim.coordinates.forEach((square) => {
      fabric[square] ? fabric[square] += 1 : fabric[square] = 1;
    });
  });

  return fabric;
}

function findOverlaps(claimedFabric) {
  return Object.keys(claimedFabric).filter((square) => claimedFabric[square] > 1);
}

function findClaimWithoutOverlaps(claims, claimedFabric) {
  return claims.find((claim) => {
    return claim.coordinates.every((square) => claimedFabric[square] == 1);
  });
}
