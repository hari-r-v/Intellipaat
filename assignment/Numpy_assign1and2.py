#!/usr/bin/env python
# coding: utf-8

# In[1]:


#Module 4: Numpy Assignment-1


# In[2]:


#You work in XYZ Corporation as a Data Analyst. Your corporation has told you to use the numpy
#package and do some tasks related to that:


# In[3]:


#1.Create a 3x3 matrix array with values ranging from 2 to 10


# In[4]:


import numpy as np


# In[5]:


A=np.arange(2,11).reshape(3,3)
print(A)


# In[6]:


#2.Create a numpy array having user input values and convert the integer type to the float type
#of the elements of the array.For instance:
#Original array
#[1, 2, 3, 4]
#Array converted to a float type:
#[ 1. 2. 3. 4.]


# In[7]:


B=[1,2,3,4]
print(B)
X=np.asfarray(B)
print(X)


# In[8]:


#3.Write a Numpy program to append values to the end of an array. For instance:
#Original array:
#[10, 20, 30]
#After append values to the end of the array:
#[10 20 30 40 50 60 70 80 90]


# In[9]:


C=np.array([10,20,30])
print(C)
Y=np.append(C,[[40,50,60],[70,80,90]])
print(Y)


# In[10]:


#4.Create two numpy arrays and add the elements of both the arrays and store the result in
#sumArray


# In[11]:


a=np.array([2,3,4])
b=np.array([1,1,2])
Sum=np.add(a,b)
print(Sum)


# In[12]:


#Create a 3*3 array having values from 10-90(interval of 10) and store that in array1. Perform
#the following tasks:
#a. Extract the 1st row from the array.
#b. Extract the last element from the array


# In[13]:


x=[[30*y+10*x for x in range(1,4)]for y in range(3)]
x=np.squeeze(np.asarray(x))
print(x[:1])
print(x[2][2])


# In[14]:


#Module 4: Data Structure Assignment-2


# In[15]:


#1. Create a list named ‘myList’ that is having the following elements: 10,20,30,’apple’, True,
#8.10.
#a. Now in the ‘myList’, append these values: 30,40
#b. After that reverse the elements of the ‘myList’ and store that in ‘reversedList’


# In[16]:


mylist=[10,20,30,'apple','true',8,10]
mylist.append(30)
mylist.append(40)
print(mylist)


# In[17]:


mylist.reverse()
print(mylist)


# In[18]:


#2.Create a dictonary with key values as 1,2,3 and the values as ‘data’,’information’, and ‘text’.
#a. After that eliminate the ‘text’ value form the dictonary.
#b. Add ‘features’ in the dictonary.
#c. Fetch the ‘data’ element from the dictonary and display it in the output.


# In[19]:


dlist={1:'data',2:'information',3:'text'}
print(dlist)


# In[20]:


del dlist[3]


# In[21]:


dlist


# In[22]:


dlist[3]='feature'


# In[23]:


dlist


# In[24]:


print(dlist[1])


# In[25]:


#Create a tuple and add these elements 1,2,3,apple,mango in ‘my_tuple


# In[26]:


my_tuple=(1,2,3,'apple','mango')


# In[27]:


my_tuple


# In[28]:


#Create another tuple named numeric_tuple consisting of only integer values 10,20,30,40,50
#a. Find the minimum value from the numeric_tuple.
#b. Concatenate my_tuple with numeric_tuple and store the result in r1.
#c. Duplicate the tuple named my_tuple 2 times and store that in ‘newdupli’.


# In[29]:


tp=(10,20,30,40,50)


# In[30]:


print(min(tp))


# In[31]:


ttp= np.concatenate((my_tuple,tp))


# In[32]:


print(ttp)


# In[33]:


newdupli=((my_tuple,)*2)
newdupli


# In[34]:


#Create 2 sets with name set1 and set2, where set1 contains{1,2,3,4,5} and set2 to
#contains{2,3,7,6,1}
#a. Perform the below operation:
#a. set1 union set2
#b. set1 intersection set2
#c. set1 difference set2


# In[35]:


set1={1,2,3,4,5}
set2={2,3,7,6,1}


# In[36]:


union=set1.union(set2)


# In[37]:


union


# In[38]:


union_intersect=set1.intersection(set2)
union_intersect


# In[39]:


union_diff=set1.difference(set2)
union_diff


# In[ ]:





# In[ ]:




