fetch("https://your-api.onrender.com/projects") // Adjust this to your real deployed backend API
  .then((res) => res.json())
  .then((data) => {
    const container = document.getElementById("project-list");
    container.innerHTML = data.map((p) => `<div class="card m-2 p-3">${p.title}</div>`).join("");
  });

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

// Typed.js animation
document.addEventListener("DOMContentLoaded", function () {
  if (document.querySelector(".text-slider")) {
    const typed_strings = document.querySelector(".text-slider-items").textContent;
    new Typed(".text-slider", {
      strings: typed_strings.split(","),
      typeSpeed: 80,
      backSpeed: 30,
      backDelay: 1100,
      loop: true,
    });
  }
});

const counters = document.querySelectorAll(".counter");

const animateCounter = (counter) => {
  const targetStr = counter.getAttribute("data-target");
  const isPercent = targetStr.includes("%");
  const target = parseInt(targetStr); // remove % for calculation
  const speed = 100;

  const update = () => {
    const current = parseInt(counter.innerText);
    const increment = Math.ceil(target / speed);

    if (current < target) {
      counter.innerText = isPercent ? `${current + increment}%` : current + increment;
      setTimeout(update, 20);
    } else {
      counter.innerText = isPercent ? `${target}%` : target;
    }
  };

  update();
};

const observer = new IntersectionObserver(
  (entries, observer) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const counter = entry.target;
        animateCounter(counter);
        observer.unobserve(counter);
      }
    });
  },
  {
    threshold: 0.5,
  }
);

counters.forEach((counter) => {
  observer.observe(counter);
});

//==============
document.addEventListener("DOMContentLoaded", function () {
  const cards = Array.from(document.querySelectorAll(".portfolio-card"));
  const carouselInner = document.getElementById("portfolioCarouselInner");
  const carouselCaption = document.getElementById("portfolioModalCaption");
  const portfolioModalEl = document.getElementById("portfolioModal");
  const portfolioModal = new bootstrap.Modal(portfolioModalEl);
  const modalTitle = document.getElementById("portfolioModalTitle");
  let portfolioCarousel;

  function buildCarousel(startIndex) {
    carouselInner.innerHTML = ""; // Clear previous content
    carouselCaption.innerHTML = "";

    // Build ALL items into the carousel
    cards.forEach((card, index) => {
      const img = card.dataset.image;
      const description = card.dataset.description;
      const activeClass = index === startIndex ? "active" : "";

      carouselInner.innerHTML += `
      <div class="carousel-item ${activeClass}">
        <img src="${img}" class="d-block w-100" alt="Portfolio item ${index + 1}" />
      </div>`;
    });

    // Set modal title for the initial item
    const selectedCard = cards[startIndex];
    modalTitle.textContent = `${selectedCard.dataset.title} - ${selectedCard.dataset.category} / ${selectedCard.dataset.date}`;
    carouselCaption.innerHTML = `<p>${selectedCard.dataset.description}</p>`;

    // Re-initialize carousel properly
    if (portfolioCarousel) {
      portfolioCarousel.dispose();
    }

    const carouselElement = document.getElementById("portfolioCarousel");
    portfolioCarousel = new bootstrap.Carousel(carouselElement, {
      interval: false,
      ride: false,
      pause: true,
      wrap: true,
    });

    // Ensure event listener works ONCE
    carouselElement.removeEventListener("slide.bs.carousel", handleSlideEvent);
    carouselElement.addEventListener("slide.bs.carousel", handleSlideEvent);
  }

  function handleSlideEvent(e) {
    const nextIndex = e.to;
    const nextCard = cards[nextIndex];
    modalTitle.textContent = `${nextCard.dataset.title} - ${nextCard.dataset.category} / ${nextCard.dataset.date}`;
    carouselCaption.innerHTML = `<p>${nextCard.dataset.description}</p>`;
  }

  // Hook up the cards
  cards.forEach((card, index) => {
    card.addEventListener("click", () => {
      buildCarousel(index);
      portfolioModal.show();
    });
  });
});
