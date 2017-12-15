import jieba.posseg as pseg
import jieba
import jieba.analyse
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
s = "此外，公司拟对全资子公司吉林欧亚置业有限公司增资4.3亿元，增资后，吉林欧亚置业注册资本由7000万元增加到5亿元。吉林欧亚置业主要经营范围为房地产开发及百货零售等业务。目前在建吉林欧亚城市商业综合体项目。2013年，实现营业收入0万元，实现净利润-139.13万元。"
for x, w in jieba.analyse.extract_tags(s, withWeight=True):
    print('%s %s' % (x, w))
testFive = jieba.cut(s, HMM=False)
print("Default Mode: " + "/ ".join(testFive))
