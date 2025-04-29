// Contact form
document.getElementById("contactForm").addEventListener("submit", function (e) {
  e.preventDefault();
  const formData = new FormData(this);
  const data = Object.fromEntries(formData.entries());

  console.log(`submit js triggered, data: ${JSON.stringify(data)}`);

  fetch(`${BASE_API_URL}/api/contact`, {
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

// DOMContentLoaded
document.addEventListener("DOMContentLoaded", function () {
  fetchAuthor();
  fetchSections();
  fetchHighlightSkills();
  fetchSkills();
  fetchCounterStat();
  fetchPortfolio();
  fetchTestimonials();
});

/* ------------------ Author API Logic ------------------ */
function fetchAuthor() {
  let authorData;
  fetch(`${BASE_API_URL}/api/author/getAuthor`)
    .then((response) => response.json())
    .then((result) => {
      if (result.status === "success" && Array.isArray(result.data)) {
        authorData = result.data;
        populateAuthor(authorData[0]);
      } else {
        console.error("Unexpected API response:", result);
      }
    })
    .catch((error) => {
      console.error("Error fetching skill data:", error);
    });

  function populateAuthor(data) {
    // console.log(`author data: ${JSON.stringify(data)}`);

    const heroSection = document.getElementById("home");

    heroSection.style.background = `url('${data.authorProfileBackgroundImage}') center center/cover no-repeat`;

    const aboutSection = document.getElementById("about");
    const aboutImg = aboutSection.querySelector(".about-img");
    const aboutInfo = aboutSection.querySelector(".about-info");

    aboutImg.innerHTML = "";
    aboutImg.innerHTML = `
      <img
        src="${data.authorProfileImage}"
        class="img-fluid rounded b-shadow-a"
        alt="profile picture" />
    `;

    aboutInfo.innerHTML = "";
    aboutInfo.innerHTML = `
      <p>
        <strong>Name:</strong>
        ${data.authorName}
      </p>
      <p>
        <strong>Profile:</strong>
        ${data.authorTitle}
      </p>
      <p>
        <strong>Email:</strong>
        ${data.authorEmail}
      </p>
      <p>
        <strong>Phone 1:</strong>
        ${data.authorPhone1}
      </p>
      <p class="mb-0">
        <strong>Phone 2:</strong>
        ${data.authorPhone2}
      </p>
    `;

    const contactSection = document.getElementById("contact");
    const contactInfoList = contactSection.querySelector(".list-unstyled");

    contactInfoList.innerHTML = "";
    contactInfoList.innerHTML = `
    <li>
      <svg class="bi icon-small-info" width="0.9em" height="0.9em" fill="currentColor">
        <use xlink:href="../public/icons/bootstrap-icons.svg#telephone-fill" />
      </svg>
      ${data.authorPhone1}
    </li>
    <li>
      <svg class="bi icon-small-info" width="0.9em" height="0.9em" fill="currentColor">
        <use xlink:href="../public/icons/bootstrap-icons.svg#telephone-fill" />
      </svg>
      ${data.authorPhone2}
    </li>
    <li>
      <svg class="bi icon-small-info" width="0.9em" height="0.9em" fill="currentColor">
        <use xlink:href="../public/icons/bootstrap-icons.svg#envelope" />
      </svg>
      ${data.authorEmail}
    </li>
    `;

    // Render Social Links if available
    const socialLinks = data.authorSocialLinks;
    if (socialLinks && typeof socialLinks === "object") {
      const socialLinksSection = document.getElementById("social-links");
      socialLinksSection.innerHTML = "";

      Object.entries(socialLinks).forEach(([platform, url]) => {
        if (platform.toLowerCase() === "linkedin") {
          socialLinksSection.innerHTML += `
            <div class="icon-contact-wrapper me-3 mb-3" >
              <a href="${url}" target="_blank">
                <svg class="bi icon-contact" width="0.7em" height="0.7em" fill="currentColor">
                  <use xlink:href="../public/icons/bootstrap-icons.svg#linkedin" />
                </svg>
              </a>
            </div>
          `;
        }
      });
    }
  }
}

/* ------------------ Section API Logic ------------------ */
function fetchSections() {
  let sectionData = [];
  fetch(`${BASE_API_URL}/api/section/getAllSection`)
    .then((response) => response.json())
    .then((result) => {
      if (result.status === "success" && Array.isArray(result.data)) {
        sectionData = result.data;
        // console.log(`successfully fetch section data, data: ${JSON.stringify(sectionData)}`);
        sectionData.forEach((section) => {
          switch (section.sectionName) {
            case "hero":
              handleHeroSection(section);
              break;
            case "about me":
              handleAboutMeSection(section);
              break;
            case "skills":
              handleSkillsSection(section);
              break;
            case "portfolio":
              handlePortfolioSection(section);
              break;
            case "contact":
              handleContactSection(section);
              break;
            case "send message":
              handleSendMessageSection(section);
              break;
          }
          // Add more section handlers here (e.g., about me, skills)
        });
      }
    })
    .catch((error) => console.error("Error fetching sections:", error));
}

function handleHeroSection(section) {
  const heroSection = document.getElementById("home");
  if (section.isDisplay) {
    heroSection.style.display = "flex";
    heroSection.querySelector("h1").textContent = section.sectionHeadline;
    heroSection.querySelector(".text-slider-items").textContent = section.sectionDescription;
    // Typed.js animation
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
  } else {
    heroSection.style.display = "none";
  }
}

function handleAboutMeSection(section) {
  const aboutSection = document.getElementById("about");
  if (section.isDisplay) {
    aboutSection.querySelector(".aboutTitle").textContent = section.sectionHeadline;
    aboutSection.querySelector(".aboutDescription").innerHTML = section.sectionDescription;
  } else {
    aboutSection.style.display = "none";
  }
}

function handleSkillsSection(section) {
  const skillsSection = document.getElementById("skills");
  if (section.isDisplay) {
    skillsSection.querySelector(".skillsTitle").textContent = section.sectionHeadline;
    skillsSection.querySelector(".skillsDescription").textContent = section.sectionDescription;
  } else {
    skillsSection.style.display = "none";
  }
}

function handlePortfolioSection(section) {
  const portfolioSection = document.getElementById("work");
  if (section.isDisplay) {
    portfolioSection.querySelector(".portfolioTitle").textContent = section.sectionHeadline;
    portfolioSection.querySelector(".portfolioDescription").textContent = section.sectionDescription;
  } else {
    portfolioSection.style.display = "none";
  }
}

function handleContactSection(section) {
  const contactSection = document.getElementById("contact");
  if (section.isDisplay) {
    contactSection.querySelector(".contactTitle").textContent = section.sectionHeadline;
    contactSection.querySelector(".contactDescription").textContent = section.sectionDescription;
  } else {
    contactSection.style.display = "none";
  }
}

function handleSendMessageSection(section) {
  const contactSection = document.getElementById("contact");
  if (section.isDisplay) {
    contactSection.querySelector(".sendMessageTitle").textContent = section.sectionHeadline;
  } else {
    contactSection.style.display = "none";
  }
}

/* ------------------ Highlight Skill API Logic ------------------ */
function fetchHighlightSkills() {
  const aboutSection = document.getElementById("about");
  const highlishSkillContainer = aboutSection.querySelector(".about-programming");
  let highlightSkillData = [];
  fetch(`${BASE_API_URL}/api/highlightSkill/getAllHighlightSkill`)
    .then((response) => response.json())
    .then((result) => {
      if (result.status === "success" && Array.isArray(result.data)) {
        highlightSkillData = result.data;
        populateSkills(highlightSkillData);
      } else {
        console.error("Unexpected API response:", result);
      }
    })
    .catch((error) => {
      console.error("Error fetching skill data:", error);
    });

  function populateSkills(data) {
    highlishSkillContainer.innerHTML = `<p class="mt-4 mb-3"><strong>Programming Highlight</strong></p>`;
    data.forEach((item, index) => {
      const cardHTML = `
          <div class="mb-3">
            <div class="d-flex justify-content-between">
              <span>${item.title}</span>
              <span>${item.proficiency}%</span>
            </div>
            <div class="skill-bar">
              <div class="skill-progress" style="width: ${item.proficiency}%"></div>
            </div>
          </div>
        `;
      highlishSkillContainer.innerHTML += cardHTML;
    });
  }
}

/* ------------------ Skills API Logic ------------------ */
function fetchSkills() {
  const cardsContainer = document.getElementById("skillCardsContainer");
  let skillData = [];
  fetch(`${BASE_API_URL}/api/skill/getAllSkill`)
    .then((response) => response.json())
    .then((result) => {
      if (result.status === "success" && Array.isArray(result.data)) {
        skillData = result.data;
        populateSkills(skillData);
      } else {
        console.error("Unexpected API response:", result);
      }
    })
    .catch((error) => {
      console.error("Error fetching skill data:", error);
    });

  function populateSkills(data) {
    cardsContainer.innerHTML = "";
    data.forEach((item, index) => {
      // console.log(`skill item: ${JSON.stringify(item)}`);
      const cardHTML = `
          <div class="col">
            <div class="card text-center border-0 shadow-sm p-4">
              <div class="icon-wrapper mx-auto mb-3">
                <svg class="bi icon" width="1em" height="1em" fill="currentColor">
                  <use xlink:href="../public/icons/bootstrap-icons.svg#${item.skillIcon}" />
                </svg>
              </div>
              <h5 class="fw-bold">${item.skillTitle}</h5>
              <p class="text-muted">
                ${item.skillDescription}
              </p>
            </div>
          </div>
        `;
      cardsContainer.innerHTML += cardHTML;
    });
  }
}

/* ------------------ Counter Stat API Logic ------------------ */
function fetchCounterStat() {
  const counterSection = document.getElementById("counterSummary");
  const counterStatContainer = counterSection.querySelector(".highlight-statistics-container");
  let highlightStatData = [];
  fetch(`${BASE_API_URL}/api/highlightStat/getAllHighlightStat`)
    .then((response) => response.json())
    .then((result) => {
      if (result.status === "success" && Array.isArray(result.data)) {
        highlightStatData = result.data;
        populateSkills(highlightStatData);
      } else {
        console.error("Unexpected API response:", result);
      }
    })
    .catch((error) => {
      console.error("Error fetching stat data:", error);
    });

  function populateSkills(data) {
    counterStatContainer.innerHTML = "";

    data.forEach((item, index) => {
      let displayValue = item.unit === "percent" ? `${item.value}%` : `${item.value}`;
      const cardHTML = `
          <div class="col-sm-6 col-lg-3">
            <div class="counter-box">
              <div class="counter-ico mb-2">
                <div class="ico-circle">
                  <svg class="bi" width="1em" height="1em" fill="currentColor">
                    <use xlink:href="../public/icons/bootstrap-icons.svg#${item.iconName}" />
                  </svg>
                </div>
              </div>
              <h2 class="counter" data-target="${displayValue}">0</h2>
              <p class="counter-text">${item.title}</p>
            </div>
          </div>
        `;
      counterStatContainer.innerHTML += cardHTML;
    });

    const counters = counterSection.querySelectorAll(".counter");
    counters.forEach((counter) => {
      observer.observe(counter);
    });
  }

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
        setTimeout(update, 40);
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
}

/* ------------------ Portfolio API Logic ------------------ */
function fetchPortfolio() {
  const cardsContainer = document.getElementById("portfolioCardsContainer");
  const carouselInner = document.getElementById("portfolioCarouselInner");
  const carouselCaption = document.getElementById("portfolioModalCaption");
  const portfolioModalEl = document.getElementById("portfolioModal");
  const modalTitle = document.getElementById("portfolioModalTitle");
  let portfolioModal = new bootstrap.Modal(portfolioModalEl);
  let portfolioCarousel;
  let portfolioData = [];

  // Fetch data from API (replace URL with your actual endpoint)

  fetch(`${BASE_API_URL}/api/portfolio/getAllPortfolio`, {
    method: "GET",
    headers: { "Content-Type": "application/json" },
  })
    .then((response) => response.json())
    .then((result) => {
      if (result.status === "success" && Array.isArray(result.data)) {
        portfolioData = result.data; // Save for later use
        populateCards(result.data);
      } else {
        console.error("Unexpected API response:", result);
      }
    })
    .catch((error) => {
      console.error("Error fetching portfolio data:", error);
    });

  function populateCards(data) {
    cardsContainer.innerHTML = ""; // Clear existing cards
    data.forEach((item, index) => {
      const cardHTML = `
        <div class="col">
          <div class="card border-0 shadow-sm portfolio-card overflow-hidden" 
               data-index="${index}" 
               data-title="${item.title}" 
               data-date="${item.date}" 
               data-category="${item.category}" 
               data-image="${item.cover_image}" 
               data-description="${item.description}">
            <div class="portfolio-img-wrapper ratio ratio-4x3">
              <img src="${item.cover_image}" class="card-img-top img-zoom" alt="portfolio image" />
            </div>
            <div class="card-body d-flex flex-column">
              <h6 class="card-title mb-1">${item.title}</h6>
              <div class="d-flex justify-content-between align-items-center mt-auto">
                <p class="work-subtitle text-primary mb-0">
                  ${item.category}
                  <span class="text-muted">/ ${item.date}</span>
                </p>
                <svg class="bi" width="20" height="20" fill="currentColor">
                  <use xlink:href="../public/icons/bootstrap-icons.svg#chevron-right" />
                </svg>
              </div>
            </div>
          </div>
        </div>
      `;
      cardsContainer.innerHTML += cardHTML;
    });

    // Hook up the cards after they're added
    const newCards = Array.from(document.querySelectorAll(".portfolio-card"));
    newCards.forEach((card) => {
      card.addEventListener("click", () => {
        const index = parseInt(card.dataset.index);
        buildCarousel(index);
        portfolioModal.show();
      });
    });
  }

  function buildCarousel(startIndex) {
    carouselInner.innerHTML = ""; // Clear previous content
    carouselCaption.innerHTML = "";

    portfolioData.forEach((item, index) => {
      const activeClass = index === startIndex ? "active" : "";
      carouselInner.innerHTML += `
        <div class="carousel-item ${activeClass}">
          <img src="${item.cover_image}" class="d-block w-100" alt="Portfolio item ${index + 1}" />
        </div>`;
    });

    // Set modal title for the initial item
    const selectedItem = portfolioData[startIndex];
    modalTitle.textContent = `${selectedItem.title} - ${selectedItem.category} / ${selectedItem.date}`;
    carouselCaption.innerHTML = `<p>${selectedItem.description}</p>`;

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

    carouselElement.removeEventListener("slide.bs.carousel", handleSlideEvent);
    carouselElement.addEventListener("slide.bs.carousel", handleSlideEvent);
  }

  function handleSlideEvent(e) {
    const nextIndex = e.to;
    const nextItem = portfolioData[nextIndex];
    modalTitle.textContent = `${nextItem.title} - ${nextItem.category} / ${nextItem.date}`;
    carouselCaption.innerHTML = `<p>${nextItem.description}</p>`;
  }
}

/* ------------------ Testimonial API Logic ------------------ */
function fetchTestimonials() {
  const testimonialSection = document.getElementById("testimonial");
  const testimonialCarousel = testimonialSection.querySelector(".testimonial-carousel");
  const carouselIndicators = testimonialSection.querySelector(".custom-indicators");

  let testimonialData = [];
  fetch(`${BASE_API_URL}/api/testimonial/getAllTestimonial`)
    .then((response) => response.json())
    .then((result) => {
      if (result.status === "success" && Array.isArray(result.data)) {
        testimonialData = result.data;
        populateTestimonials(testimonialData);
      } else {
        console.error("Unexpected API response:", result);
      }
    })
    .catch((error) => {
      console.error("Error fetching testimonial data:", error);
    });

  function populateTestimonials(data) {
    testimonialCarousel.innerHTML = "";
    carouselIndicators.innerHTML = "";

    data.forEach((item, index) => {
      // Create each carousel-item
      const cardHTML = `
        <div class="carousel-item ${index === 0 ? "active" : ""}">
          <img
            src="${item.profilePhoto}"
            alt="Testimonial ${index}"
            class="rounded-circle mb-3 testimonial-img" />
          <h4 class="fw-bold">${item.name}</h4>
          <p class="testimonial-text">${item.review}</p>
          ${
            item.linkedin
              ? `<a class="btn btn-secondary btn-sm" href="${item.linkedin}" target="_blank">LinkedIn</a>`
              : ""
          }
        </div>
      `;
      testimonialCarousel.innerHTML += cardHTML;

      // Create each indicator button
      const indicatorButton = `
        <button
          type="button"
          data-bs-target="#testimonialCarousel"
          data-bs-slide-to="${index}"
          class="${index === 0 ? "active" : ""}"
          aria-current="${index === 0 ? "true" : "false"}"
          aria-label="Slide ${index + 1}">
        </button>
      `;
      carouselIndicators.innerHTML += indicatorButton;
    });
  }
}
