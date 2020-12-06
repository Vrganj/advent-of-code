import re

with open('input.txt') as file:
    passports = file.read().strip().split('\n\n')

solution = 0

for passport in passports:
    passport = passport.replace(' ', '\n')
    keys = []
    for field in passport.split('\n'):
        key, value = field.split(':')

        if key == 'byr':
            value = int(value)
            if 2002 >= value >= 1920:
                keys.append(key)
        elif key == 'iyr':
            value = int(value)
            if 2020 >= value >= 2010:
                keys.append(key)
        elif key == 'eyr':
            value = int(value)
            if 2030 >= value >= 2020:
                keys.append(key)
        elif key == 'hgt':
            unit = value[-2:]

            if unit != 'cm' and unit != 'in': continue

            value = int(value[:-2])

            if unit == 'cm':
                if 193 >= value >= 150:
                    keys.append(key)
            elif unit == 'in':
                if 76 >= value >= 59:
                    keys.append(key)
        elif key == 'hcl':
            if re.match(r'^#[a-f0-9]{6}$', value) is not None:
                keys.append(key)
        elif key == 'pid':
            if re.match(r'^\d{9}$', value) is not None:
                keys.append(key)
        elif key == 'ecl':
            if value in ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']:
                keys.append(key)

    if 'byr' in keys and 'iyr' in keys and 'eyr' in keys and 'hgt' in keys and 'hcl' in keys and 'ecl' in keys and 'pid' in keys:
        solution += 1

print(solution)
