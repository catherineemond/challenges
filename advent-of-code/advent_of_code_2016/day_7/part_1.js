// Method exec(): Match and Capture Groups

// > /a(b+)a/.exec('_abbba_aba_')
// [ 'abbba', 'bbb' ]

const ABA = /(\w)(\w)(\1)/

function getAba(string) {
  return ABA.exec(string);
}

let string = 'zazbz[bzb]cdb'
console.log(getAba(string));
