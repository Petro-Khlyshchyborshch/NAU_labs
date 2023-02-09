import os


def count_lines(filename, chunk_size=1<<13):
    with open(filename) as file:
        return sum(chunk.count('\n')
                   for chunk in iter(lambda: file.read(chunk_size), ''))


path = "D:\project"

cpp_counter = 0
cpp_counter_str = 0

c_counter = 0
c_counter_str = 0

h_counter = 0
h_counter_str = 0

hpp_counter = 0
hpp_counter_str = 0

for root, dirs, files in os.walk(path):
    for file in files:
        if (file.endswith(".cpp")):
            try:
                #print(os.path.join(root, file))
                #print(count_lines(os.path.join(root, file)))
                cpp_counter_str+=count_lines(os.path.join(root, file))
            except Exception:
                print("eror file")
            cpp_counter += 1

        if (file.endswith(".c")):
            try:
                #print(os.path.join(root, file))
                #print(count_lines(os.path.join(root, file)))
                c_counter_str+=count_lines(os.path.join(root, file))
            except Exception:
                print("eror file")
            c_counter += 1

        if (file.endswith(".h")):
            try:
                #print(os.path.join(root, file))
                #print(count_lines(os.path.join(root, file)))
                h_counter_str+=count_lines(os.path.join(root, file))
            except Exception:
                print("eror file")
            h_counter+=1

        if (file.endswith(".hpp")):
            try:
                # print(os.path.join(root, file))
                # print(count_lines(os.path.join(root, file)))
                hpp_counter_str += count_lines(os.path.join(root, file))
            except Exception:
                print("eror file")
            hpp_counter += 1

print("cpp_counter = ", cpp_counter)
print("c_counter = ", c_counter)

print("")
print("h_counter = ", h_counter)
print("hpp_counter = ", hpp_counter)

print("")
print("cpp_counter_str = ", cpp_counter_str)
print("c_counter_str = ", c_counter_str)

print("")
print("h_counter_str = ", h_counter_str)
print("hpp_counter_str = ", hpp_counter_str)

print("")
print("count of c,cpp file = ",cpp_counter+c_counter)
print("count of h,hpp file = ",h_counter+hpp_counter)

print("count str of c,cpp file = ",cpp_counter_str+c_counter_str)
print("count str of h,hpp file = ",h_counter_str+hpp_counter_str)
