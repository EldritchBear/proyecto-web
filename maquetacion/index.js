const { exec } = require('child_process');
const path = require("path")
const express = require("express")
const app = express()

app.use(express.static(path.join(__dirname, "public/")))
app.use(express.static(path.join(__dirname, "pages/")))

app.get("/", (req,res) => {
  exec('npx tailwindcss -i ./input.css -o ./public/out.css ', (err, stdout, stderr) => {
  if (err) {
    // node couldn't execute the command
    return;
  }
});
  res.sendFile(path.join("__dirname", "pages/index.html"))
})

app.get("/index", (req,res) => {
  exec('npx tailwindcss -i ./input.css -o ./public/out.css ', (err, stdout, stderr) => {
  if (err) {
    return;
  }
});
  res.sendFile(path.join(__dirname, "pages", "index.html"))
})

app.get("/robot", (req,res) => {
  exec('npx tailwindcss -i ./input.css -o ./public/out.css ', (err, stdout, stderr) => {
  if (err) {
    return;
  }
});
  res.sendFile(path.join(__dirname, "pages", "robot.html"))
})

app.get("/editar", (req,res) => {
  exec('npx tailwindcss -i ./input.css -o ./public/out.css ', (err, stdout, stderr) => {
  if (err) {
    return;
  }
});
  res.sendFile(path.join(__dirname, "pages", "editar.html"))
})

app.get("/inicio_sesion", (req,res) => {
  exec('npx tailwindcss -i ./input.css -o ./public/out.css ', (err, stdout, stderr) => {
  if (err) {
    return;
  }
});
  res.sendFile(path.join(__dirname, "pages", "inicio_sesion.html"))
})

app.get("/estado", (req,res) => {
  exec('npx tailwindcss -i ./input.css -o ./public/out.css ', (err, stdout, stderr) => {
  if (err) {
    return;
  }
});
  res.sendFile(path.join(__dirname, "pages", "estado.html"))
})

app.get("/mi_cuenta", (req,res) => {
  exec('npx tailwindcss -i ./input.css -o ./public/out.css ', (err, stdout, stderr) => {
  if (err) {
    return;
  }
});
  res.sendFile(path.join(__dirname, "pages", "mi_cuenta.html"))
})

app.get("/registrarse", (req,res) => {
  exec('npx tailwindcss -i ./input.css -o ./public/out.css ', (err, stdout, stderr) => {
  if (err) {
    return;
  }
});
  res.sendFile(path.join(__dirname, "pages", "registrarse.html"))
})

app.get("/historial", (req,res) => {
  exec('npx tailwindcss -i ./input.css -o ./public/out.css ', (err, stdout, stderr) => {
  if (err) {
    return;
  }
});
  res.sendFile(path.join(__dirname, "pages", "historial.html"))
})

app.listen(3000, () => {
  console.log("🚀 Shipping on port 3000")
})
