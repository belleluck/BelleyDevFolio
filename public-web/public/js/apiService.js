// import Swal from "../../node_modules/sweetalert2";

// Contact form
document.getElementById("contactForm").addEventListener("submit", function (e) {
  e.preventDefault();
  const formData = new FormData(this);
  const data = Object.fromEntries(formData.entries());

  console.log(`submit js triggered, data: ${JSON.stringify(data)}`);

  fetch("http://localhost:3000/api/contact", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  })
    .then((response) => {
      if (!response.ok) {
        console.log(`Failed to send message: ${response}`);
        throw new Error("Failed to send message.");
      }
      return response.json();
    })
    .then((result) => {
      Swal.fire({
        title: "Success!",
        text: "Your message has been sent successfully!",
        icon: "success",
        confirmButtonText: "OK",
        confirmButtonColor: "var(--bs-success)", // Bootstrap primary color
        timer: 3000,
        timerProgressBar: true,
        didClose: () => {
          const form = document.getElementById("contactForm");
          form.reset();
          console.log(`"Message sent successfully: ${result.message}`);
        },
      });
    })
    .catch((error) => {
      console.error(error);
      console.log(`Error sending message: ${error}`);
      alert("Error sending message. Please try again.");
    });
});
