import requests
import json
import time

def getquestion(level,count):
   ret = []
   for q in range(count):
      r = requests.get(f'https://lip2.xyz/api/millionaire.php?q={level}')
      a = r.json()['data']
      print(a)
      a['question'] = a['question'].replace("\u2063", '')
      a['answer'] = a['answers'][a['id']]
      a['value'] = f'${100/level}'
      ret.append(a)
      time.sleep(10)
   return ret
   
allq = []
for l in range(1,5):
   allq = allq + getquestion(l,l*10)


with open('res/question.json', 'w', encoding='utf8') as questionf:
   json.dump(allq,questionf,ensure_ascii=False)