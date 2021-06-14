# Pitch-Detection (warm-up project!)
Implementation of Pitch Detection algorithms with Matlab

I recorded the sentence "امروز هوا روشن و آفتابی است" in Persian (you can record any sentence in your language!). and tried to estimate pitch with 3 different methods:

## the first: speech pitch detection with the short-time autocorrelation function
![1](https://user-images.githubusercontent.com/85555218/121964501-e49e0000-cd80-11eb-9ba5-90defdb84335.png)

        5 pitch candidates have been considered in each frame 
        run main(1).m to see results

### autocorrelation result
![auto_corr](https://user-images.githubusercontent.com/85555218/121964953-8887ab80-cd81-11eb-8886-6ccedd15a487.jpg)


## the second: speech pitch detection with average magnitude difference function (short-time amdf)
![2](https://user-images.githubusercontent.com/85555218/121965579-7bb78780-cd82-11eb-99c7-cb6b65de7190.jpg)


    5 pitch candidates have been considered in each frame
    run main(2).m to see results

### amdf result
![amdf](https://user-images.githubusercontent.com/85555218/121965590-7fe3a500-cd82-11eb-9c2d-708e83e01b08.jpg)


## the third: speech pitch detection with real cepstrum analysis
![3](https://user-images.githubusercontent.com/85555218/121965669-9ee23700-cd82-11eb-8e54-cff703099020.png)

    5 pitch candidates have been considered in each frame
    run main(3).m to see results

### real cepstrum result
![cepstrum](https://user-images.githubusercontent.com/85555218/121965676-a275be00-cd82-11eb-81ba-741973a445a1.jpg)
