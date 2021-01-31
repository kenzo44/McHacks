## Inspiration

The covid-19 pandemic has exacerbated mental health concerns and caused a work-from-home movement along with forcing counseling virtual. One tool counselors use to help keep their clients working to be mindful and actively work towards bettering their lives. The tool is championed by Dr. Russ Harris, the author of international best-seller *The Happiness Trap* it's called **'The Choice Point'** and it provides a way to quickly identify the source of your biggest problems (and recognize what you are doing that’s making them worse) and plan how to deal with them effectively. It's a guide to reducing your suffering; a map to take your life in a meaningful direction.

## What it does

choicepoint.space is a web-based dashboard to help counselors implement this strategy with clients by visualizing a client's behavior over time.

### Features

- Daily activity tracker (user input)
- Calendar to diarize past activity
- Messaging system between counselors and clients
- Goal setting
- Data visualization
- Complete database 
- Back-end functionality
- Responsive UI (Bootstrap)

## How we built it

coicepoint.space's frontend was built with Vue.js and bootstrap. The backend is developed in Lapis a Lua framework. We've also added a helpful chatbot using google's Dialogflow and Firebase.

## Challenges we ran into

We ran into challenges sending JSON data from our frontend app and parsing it in Lapis. Lapis was receiving this as plain/text.

## Accomplishments that we're proud of

This was a first-time hackathon project for three out of four team members. Getting a rough web app prototype working is a solid achievement for us. We're proud to think of this app as something that useful for professionals in psychology as an alternative to traditional paper forms that would have been filled in person. Learning to get Dialogflow and Firebase working together for chatbot functionality is another thing that we're excited about and would like to continue developing its functionality.

## What we learned

We learned teamwork, planning, a bunch about psychology and mental health as well as working with Lapis, Dialogflow, and Firebase.

## What's next for choicepoint.space

We have an informal relationship with the University of Lethbridge's counseling services and look forward to continuing prototyping with their feedback. There are many different tools and strategies that counselors use that are simply paper forms sent via pdf files currently and we'd love to help them encourage stronger engagement through making these interactive. Obviously, there are privacy, ethics, and copyright issues in this area that have not yet been fully considered.


## Build Setup

### install dependencies
```
npm install
```
### serve with hot reload at localhost:8080
```
npm run dev
```
### build for production with minification
```
npm run build
```
### lint
```
npm run lint
```

## License

[MIT](https://github.com/creativetimofficial/vue-paper-dashboard/blob/master/LICENSE.md)
