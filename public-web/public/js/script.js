// Toggle navbar color on scroll
window.addEventListener("scroll", function () {
  const navbar = document.getElementById("navbar");
  if (window.scrollY > 50) {
    navbar.classList.add("scrolled");
  } else {
    navbar.classList.remove("scrolled");
  }

  const backToTop = document.getElementById("backToTop");
  if (window.scrollY > 100) {
    // console.log(`window.scrollY: ${window.scrollY}, should show button`);
    backToTop.classList.remove("d-none");
  } else {
    // console.log(`window.scrollY: ${window.scrollY}, should hide button`);
    backToTop.classList.add("d-none");
  }
});

function scrollToTop() {
  window.scrollTo({ top: 0, behavior: "smooth" });
}
