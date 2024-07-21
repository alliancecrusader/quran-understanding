---------------------------------------------------------------------------

local function comma_count(input)
    local count = 0
    for char in input:gmatch(".") do
        if char == "," then
            count = count + 1
        end
    end
    return count
end

---------------------------------------------------------------------------

local function main(args)
    local target = args[1]
    local comma_per_line_limit = tonumber(args[2])
    local lines_that_exceed_limit = {}

    local input = io.open(target, "r"):read("*a")

    for line in input:gmatch("[^\r\n]+") do
        local comma_count_in_line = comma_count(line)
        if comma_count_in_line > comma_per_line_limit then
            table.insert(lines_that_exceed_limit, line)
        end
    end

    if #lines_that_exceed_limit > 0 then
        print("Lines that exceed the comma limit in " .. target .. ":")
        for _, line in ipairs(lines_that_exceed_limit) do
            print(line)
        end
    else
        print("No lines exceed the comma limit in " .. target)
    end
end

---------------------------------------------------------------------------

main(arg)

---------------------------------------------------------------------------