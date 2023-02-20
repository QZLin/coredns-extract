import argparse
import base64

parser = argparse.ArgumentParser()
parser.add_argument('-d', '--decode', action='store_true')
parser.add_argument('-e', '--encode', action='store_true')

parser.add_argument('-o', '--output')
parser.add_argument('-f', '--file')

parser.add_argument('--stdout', action='store_true')
parser.add_argument('--base64-input', type=str)

args = parser.parse_args()

if args.decode:
    if args.base64_input:
        b = base64.b64decode(args.base64_input)
    elif args.file:
        with open(args.file, 'r') as f:
            b = base64.b64decode(f.read())
    else:
        raise RuntimeError('input of [file] or [base64-input] required')

    if args.output:
        with open(args.output, 'wb') as f:
            f.write(b)
    if args.stdout:
        print(b)
elif args.encode:
    if args.file:
        with open(args.file, 'rb') as f:
            r = base64.b64encode(f.read())
    else:
        raise RuntimeError('input of [file] required')
    if args.stdout:
        print(r.decode(), end='')
    if args.output:
        with open(args.output, 'wb') as f:
            f.write(r)
