import re
import matplotlib.pyplot as plt

with open('lynis-result.txt', 'r') as file:
    content = file.read()

warnings = len(re.findall(r'\[WARNING\]', content))
suggestions = len(re.findall(r'Suggestion:', content))
passes = len(re.findall(r'\[PASS\]', content))

print(f"Summary Report:")
print(f"- Warnings: {warnings}")
print(f"- Suggestions: {suggestions}")
print(f"- Passes: {passes}")

# Vẽ biểu đồ
labels = ['Warnings', 'Suggestions', 'Passes']
values = [warnings, suggestions, passes]
plt.figure(figsize=(8, 6))
plt.bar(labels, values, color=['red', 'yellow', 'green'])
plt.title('Lynis Audit Summary')
plt.xlabel('Result Type')
plt.ylabel('Count')
plt.grid(True)
plt.savefig('lynis_summary.png')