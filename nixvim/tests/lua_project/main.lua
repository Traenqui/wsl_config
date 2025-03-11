local function greet(name)
  print("Hello, " .. name .. "!")
end

local name = "world"
greet(name)

local sum = 0
for i = 1, 10 do
  sum = sum + 1
end
print("sum:", sum)
