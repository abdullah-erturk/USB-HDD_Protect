# USBHDD_Protect

         Türkçe Açıklama


UYARI:
Yazma-Koruma işlemi uygulanan disk sadece koruma işleminin yapıldığı bilgisayarda işe yaramaktadır. 

Koruması sağlanan diski başka bir bilgisayara taktığınızda korumanın etkinleşmesi için mecburen USBHDD_Protect.bat dosyasının tekrardan çalıştırılması gerekir.

Bu betik dosyası ile NTFS/FAT/FAT32/exFAT/REFS bölüm yapısı fark etmeksizin tüm disklerinizi sadece bir kaç tıklama işlemi ile koruyabileceksiniz.

Bu betik dosyası hem taşınabilir usb flash ve harici disklerde hem de bilgisayarınızda ana kartınıza direkt bağlı olan yerel disklerde çalışır.

USBHDD_Protect_KodlarAçık.bat dosyasını açmak istediğinizde size şifre soracaktır.

Şifre varsayılan olarak 1234'tür. 

Ancak siz kendi şifrenizi belirlemek ve kodları da şifrelemek isterseniz USBHDD_Protect_Create.bat dosyası ile hem kendi şifrenizi belirleyebilir hem de betik dosyası not defteri ileaçıldığında kod satırları Çince karakterler görünecek şeklinde şifrelenmiş olur.

Oluşturulan Dosya tamamen şifrelidir, not defteri ile açıldığı takdirde sadece Çince karakterler olacaktır ama dosyaya çift tıkladığınızda düzgün bir şekilde çalışacaktır.

Şimdi bir senaryo oluşturalım :)

Bu senaryo sizin için bir senaryo olabilir ama benim için maalesef gerçekleşti.

Çocuğunuz okuldan geldi, siz de evde yoksunuz ve bilgisayarınızı açtı. Saçma sapan oyun sitelerine girdi bilgisayarınıza ransomware tarzı virüs bulaştırdı.

Eğer bu betik dosyası ile bilgisayarınızı çocuğunuza teslim etmeden önce tüm disklerinizi salt okunur olarak ayarlayasaydınız, ransomware virüsü bilgisayarınıza zarar veremezdi.

Bu yazdığım senaryo aynen benim başıma geldi maalesef :( 

UYARI:

Bu betik dosyası tek başına ransomware tarzı virüslere karşı koruyucu özelliği taşımaz. 

Lütfen önemli dosyalarınız için kendi güvenlik önlemlerinizi alın.		 
		 
		 
		 
         English Explanation
		 

WARNING:
The write-protection applied to the disk only works on the computer where the protection is applied. 

When you connect the protected disk to another computer, you will need to run the USBHDD_Protect.bat file again to activate the protection.

With this script file, you can easily protect all your disks, regardless of their NTFS/FAT/FAT32/exFAT/REFS partition structure, with just a few clicks.

This script file works on both portable USB flash drives and external hard drives, as well as local drives directly connected to your motherboard on your computer.

When you try to open the USBHDD_Protect_OpenSource.bat file, it will ask you for a password.

The default password is 1234 

However, if you want to set your own password and encrypt the code lines when the script file is opened with Notepad, you can use the USBHDD_Protect_Create.bat file to both set your own password and encrypt the script file.

The created file is completely encrypted, and when opened with Notepad, only Chinese characters will appear in the code lines. But when you double-click on the file, it will work properly.

Now, let's create a scenario :)

This scenario may be a scenario for you, but unfortunately, it happened to me.

Your child came home from school, and you were not at home, so they turned on your computer. 

They went to some silly game websites and infected your computer with a ransomware-type virus.

If you had set all your disks to read-only with this script file before handing over your computer to your child, the ransomware virus would not have been able to harm your computer.

The scenario I have written above actually happened to me :( 

WARNING:
This script file alone does not provide protection against ransomware-type viruses. 

Please take your own security measures for your important files.
