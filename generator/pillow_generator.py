import argparse

from PIL import Image, ImageDraw

def _parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--image',
                        type=str,
                        dest='image',
                        help='Path to where to make the output file')
    parser.add_argument('--message',
                        type=str,
                        dest='message',
                        help='Message to include in the image')
    return parser.parse_args()


if __name__ == '__main__':
    args = _parse_args()

    img = Image.new('RGB', (len(args.message) * 10, 30), color=(0, 0, 0))
    d = ImageDraw.Draw(img)
    d.text((15,10), args.message, fill=(255,255,255))

    img.save(args.image)