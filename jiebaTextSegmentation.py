import jieba.posseg as pseg
import jieba
words = pseg.cut("他来到了网易杭研大厦", HMM=False)
for word, flag in words:
    print('%s %s' % (word, flag))

testOne = jieba.cut('丰田太省了', HMM=False)
print("Default Mode: " + "/ ".join(testOne))  # 精确模式
testTwo = jieba.cut('丰田太省了', HMM=True)
print("Default Mode: " + "/ ".join(testTwo))  # 精确模式
testThree = jieba.cut('我们中出了一个叛徒', HMM=False)
print("Default Mode: " + "/ ".join(testThree))  # 精确模式
testFour = jieba.cut('我们中出了一个叛徒', HMM=True)
print("Default Mode: " + "/ ".join(testFour))  # 精确模式
