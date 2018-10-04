import App from "./app";

//get env PORT from server or use 8080
const PORT = process.env.PORT || 8080;

//App listen

App.listen(PORT, () => {
  console.log("Express running on port " + PORT);
});
