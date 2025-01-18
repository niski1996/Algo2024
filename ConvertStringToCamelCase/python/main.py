import re
def to_camel_case(text):
    trimmed_text = text.strip()
    if trimmed_text == "":
        return ''
    first_swapped = re.sub(r"_(\w)",lambda match: match.group(1).upper(), text )
    second_swapped = re.sub(r"-(\w)",lambda match: match.group(1).upper(), first_swapped )

    return second_swapped

print(to_camel_case(""))
