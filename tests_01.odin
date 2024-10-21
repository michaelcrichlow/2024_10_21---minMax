package test

import "core:fmt"
import "core:mem"
import "core:slice"
import "core:strconv"
import "core:strings"
print :: fmt.println

main :: proc() {

	my_list := [?]int{3, 2, 5, 1, -2, 4}

	print(minMax_string(my_list[:]))
	print(minMax_hashmap(my_list[:], context.temp_allocator))

	free_all(context.temp_allocator)

	// Output
	// { max: 5, min: -2 }
	// map[min=-2, max=5]
}

minMax_string :: proc(l: []int) -> string {

	max_val := max_iterable(l[:])
	min_val := min_iterable(l[:])

	b := strings.builder_make(context.temp_allocator)
	strings.write_string(&b, "{ max: ")
	strings.write_int(&b, max_val)
	strings.write_string(&b, ", min: ")
	strings.write_int(&b, min_val)
	strings.write_string(&b, " }")
	final_string := strings.to_string(b)

	return final_string
}

minMax_hashmap :: proc(l: []int, allocator := context.allocator) -> map[string]int {

	my_dict := make(map[string]int, allocator = allocator)

	max_val := max_iterable(l[:])
	min_val := min_iterable(l[:])

	my_dict["max"] = max_val
	my_dict["min"] = min_val

	return my_dict
}
