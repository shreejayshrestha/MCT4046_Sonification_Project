

```python
import pandas as pd
from matplotlib import pyplot as plt
```


```python
d = pd.read_csv("Data_WM.csv")
```


```python
d
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>AADF</th>
      <th>PedalCycle</th>
      <th>MotorCycle</th>
      <th>CarTaxies</th>
      <th>BusCoaches</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2000</td>
      <td>79920</td>
      <td>222525</td>
      <td>26956216</td>
      <td>367302</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2001</td>
      <td>78138</td>
      <td>232931</td>
      <td>27309361</td>
      <td>377048</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2002</td>
      <td>73433</td>
      <td>237346</td>
      <td>27695209</td>
      <td>353026</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2003</td>
      <td>73426</td>
      <td>267168</td>
      <td>27509617</td>
      <td>322425</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2004</td>
      <td>61833</td>
      <td>225081</td>
      <td>28108929</td>
      <td>293387</td>
    </tr>
    <tr>
      <th>5</th>
      <td>2005</td>
      <td>54449</td>
      <td>214996</td>
      <td>28135045</td>
      <td>297896</td>
    </tr>
    <tr>
      <th>6</th>
      <td>2006</td>
      <td>75335</td>
      <td>213851</td>
      <td>28273059</td>
      <td>300005</td>
    </tr>
    <tr>
      <th>7</th>
      <td>2007</td>
      <td>51618</td>
      <td>212727</td>
      <td>28132190</td>
      <td>287112</td>
    </tr>
    <tr>
      <th>8</th>
      <td>2008</td>
      <td>63598</td>
      <td>205438</td>
      <td>27845252</td>
      <td>270097</td>
    </tr>
    <tr>
      <th>9</th>
      <td>2009</td>
      <td>72132</td>
      <td>210086</td>
      <td>28232917</td>
      <td>274654</td>
    </tr>
    <tr>
      <th>10</th>
      <td>2010</td>
      <td>72116</td>
      <td>196972</td>
      <td>27854236</td>
      <td>290439</td>
    </tr>
    <tr>
      <th>11</th>
      <td>2011</td>
      <td>77867</td>
      <td>196507</td>
      <td>28550444</td>
      <td>279982</td>
    </tr>
    <tr>
      <th>12</th>
      <td>2012</td>
      <td>74252</td>
      <td>183164</td>
      <td>28394607</td>
      <td>285898</td>
    </tr>
    <tr>
      <th>13</th>
      <td>2013</td>
      <td>72482</td>
      <td>187843</td>
      <td>28160807</td>
      <td>276562</td>
    </tr>
    <tr>
      <th>14</th>
      <td>2014</td>
      <td>70136</td>
      <td>193522</td>
      <td>29010942</td>
      <td>274037</td>
    </tr>
    <tr>
      <th>15</th>
      <td>2015</td>
      <td>68440</td>
      <td>190789</td>
      <td>29309801</td>
      <td>274839</td>
    </tr>
    <tr>
      <th>16</th>
      <td>2016</td>
      <td>70844</td>
      <td>189350</td>
      <td>29984013</td>
      <td>250452</td>
    </tr>
    <tr>
      <th>17</th>
      <td>2017</td>
      <td>72502</td>
      <td>186612</td>
      <td>30250168</td>
      <td>227700</td>
    </tr>
  </tbody>
</table>
</div>




```python
plt.plot(d.MotorCycle)
```




    [<matplotlib.lines.Line2D at 0x23fc4f46278>]




![png](output_3_1.png)



```python
import time, random, os
import sc3nb as scn
```


    <IPython.core.display.Javascript object>



```python
sc = scn.startup()  # optionally use argument sclangpath="/path/to/your/sclang"

```

    Starting sclang...
    Done.
    Registering UDP callback...
    Done.
    Sclang started on non default port: 57121
    Booting server...
    Done.
    -> sc3nb started
    


```python
%%sc 
SynthDef ("bus", {arg out=0, freqb= 50, mul=0.7, ampb = 0.2;
    var f;
    f = Saw.ar(freqb,mul,0);
    Out.ar(out,f*ampb);
}).add;
```


```python
%sc g= Synth.new(\bus)
```


```python
%sc g.free
```


```python
%%sc
SynthDef ("car", {arg out=0, freqc = 2.5, mul2= 10, ampc = 1;
    var f;
    f = LFPulse.ar(LFPulse.kr(freqc, 0, 0.3, mul2, 200), 0, 0.8, 0.1);
    Out.ar(out,f*ampc);
}).add;
```


```python
%sc f= Synth.new(\car)
```


```python
%sc f.free
```


```python
%%sc
SynthDef("motorbike", { arg out=0, freqm= 30, mul3 = 100, ampm = 1;
    var m;
    m = RLPF.ar(LFPulse.ar(SinOsc.ar(10, 0, 0, 10),0.5, 0.2),freqm,0.5,100);
    Out.ar(out, m*ampm);
}).add;
```


```python
%sc e = Synth.new(\motorbike)
```


```python
%sc e.free
```


```python
queue = scn.TimedQueue()
```


```python
t0 = time.time()
delay = 0.2



# instantiate synths
#queue.put(t0+delay, sc.msg, ("/s_new", ["bus", 1234, 1, 1]))
#queue.put(t0+delay, sc.msg, ("/s_new", ["car", 1235, 1, 1]))
queue.put(t0+delay, sc.msg, ("/s_new", ["motorbike", 1236, 1, 1]))

sc.prepare_for_record(0, "my_recording.wav", 99, 2, "wav", "int16")  # buffer 99 will be used
sc.record(t0+0.1, 2001)  # recording starts in 200 ms
#sc.bundle(0.2, "/s_new", ["car", 1234, 1, 1]) 
sc.stop_recording(t0+10) # and stops in 1 seconds

# modulate with data while playing through time
for i in range (len(d)):
    onset = scn.linlin(i, 0, 18, 0, 9)
    #b_freq= scn.linlin((d.iloc[i][4]), min(d.BusCoaches),max(d.BusCoaches), 10, 100)
    #print(b_freq)
    #b_amp = scn.linlin((d.iloc[i][4]), min(d.BusCoaches),max(d.BusCoaches), 0.2, 10)
    #print(b_amp)
    #c_freq= scn.linlin((d.iloc[i][3]), min(d.CarTaxies),max(d.CarTaxies), 0.2,15)
    #c_amp= scn.linlin((d.iloc[i][3]), min(d.CarTaxies),max(d.CarTaxies), 0.2,10)
    m_freq = scn.linlin((d.iloc[i][2]), min(d.MotorCycle),max(d.MotorCycle), 30,300)
    m_amp = scn.linlin((d.iloc[i][2]), min(d.MotorCycle),max(d.MotorCycle), 0.2,10)
    #queue.put(t0 + delay + onset, sc.msg, ("/n_set",
        #[1234,'freqb', b_freq,'ampb',b_amp]))
    #queue.put(t0 + delay + onset, sc.msg, ("/n_set", 
     #   [1235, 'freqc', c_freq,'ampc',c_amp]))    
    queue.put(t0 + delay + onset, sc.msg, ("/n_set", 
        [1236, 'freqm',m_freq,'ampm', m_amp]))
           
    
# shut down synth when finished
#queue.put(t0 + delay + onset, sc.msg, ("/n_free", 1234))
#queue.put(t0 + delay + onset, sc.msg, ("/n_free", 1235))
queue.put(t0 + delay + onset, sc.msg, ("/n_free", 1236))
```
