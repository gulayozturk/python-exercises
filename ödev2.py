lessonCount=int(input("Ders Sayisini giriniz:"))

passedLessons=[]
failedLessons=[]


passCount=0
failCount=0

for i in range(0,lessonCount):
    midterm=float(input(f"{i+1}. dersinizin vize notunu giriniz: "))
    final=float(input(f"{i+1}. dersinizin final notunu giriniz: "))
   

    totalNote=(midterm*0.4)+(final*0.6)
    if 0<totalNote<50:
        failedLessons.append([totalNote])
        failCount+=1
    elif 50<=totalNote<=100:
        passedLessons.append([totalNote])
        passCount+=1
    else:
        print("Sinaviniz geçersizdir.")

print(f"{passCount} adet dersten geçtiniz. Notlarınız: {passedLessons} ")
print(f"{failCount} adet dersten kaldiniz. Notlarınız: {failedLessons} ")
