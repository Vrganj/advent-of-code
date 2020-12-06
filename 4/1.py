with open('input.txt') as file:
    passports = file.read().strip().split('\n\n')

solution = 0

for passport in passports:
    passport = passport.replace(' ', '\n')
    keys = []
    for field in passport.split('\n'):
        key, value = field.split(':')
        keys.append(key)

    if 'byr' in keys and 'iyr' in keys and 'eyr' in keys and 'hgt' in keys and 'hcl' in keys and 'ecl' in keys and 'pid' in keys:
        solution += 1

print(solution)
