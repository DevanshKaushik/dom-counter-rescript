@val external document: {..} = "document"

let count = ref(0)

let updateCount = steps => {
  count := count.contents + steps
}

let getClassName = count => {
  if count == 0 {
    "count-zero"
  } else if count > 0 {
    "count-positive"
  } else {
    "count-negative"
  }
}

let renderCountTextView = (count, className) => {
  let ele = document["getElementById"]("count")

  ele["innerText"] = `Count is ${Belt.Int.toString(count)}`
  ele["className"] = `count ${className}`
}

let renderView = steps => {
  updateCount(steps)

  let count = count.contents
  let className = getClassName(count)
  renderCountTextView(count, className)
}

let plusOne = () => renderView(1)
let minusOne = () => renderView(-1)

let plusBtn = document["getElementById"]("plus-one")
let minusBtn = document["getElementById"]("minus-one")

plusBtn["addEventListener"]("click", plusOne)
minusBtn["addEventListener"]("click", minusOne)
