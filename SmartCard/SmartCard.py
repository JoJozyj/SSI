import hashlib
import sys
import qrcode


# 对smart_card 的uid 进行哈希处理并返回
class SmartCard:
    def __init__(self, uid, path):
        self.__uid = uid
        self.__qrcode_path = path

    def __hash_uid(self):
        hash_uid = hashlib.sha256(self.__uid.encode()).hexdigest() if self.__uid != "" else print("Input is invalid!")
        return hash_uid

    def generate_qrcode(self):
        hashed_uid = self.__hash_uid()
        qr = qrcode.QRCode(
            version=1,
            error_correction=qrcode.constants.ERROR_CORRECT_L,
            box_size=10,
            border=4,
        )
        js_data = {"hashed_uid": hashed_uid}
        qr.add_data(js_data)
        qr.make(fit=True)

        img = qr.make_image(fill_color="black", back_color="white")
        try:
            img.save(r"%s\smart_card_qrcode.png" % self.__qrcode_path)
            message = "QR code has been created successfully!"
        except:
            message = "QR code is failed to save!"
        return message


if __name__ == '__main__':
    SC = SmartCard(sys.argv[2], sys.argv[1])
    print(SC.generate_qrcode())
