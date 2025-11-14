/* Dewan Gurung — Futuristic Portfolio Interactions */

const qs = (sel, el = document) => el.querySelector(sel);
const qsa = (sel, el = document) => [...el.querySelectorAll(sel)];

// Loader
window.addEventListener('load', () => {
  const loader = qs('#loader');
  setTimeout(() => loader.classList.add('hidden'), 400);
});

// Stars background canvas
(function initStars() {
  const canvas = document.getElementById('stars-canvas');
  if (!canvas) return;
  const ctx = canvas.getContext('2d');
  let w, h, stars;

  function resize() {
    w = canvas.width = window.innerWidth;
    h = canvas.height = window.innerHeight;
    stars = generateStars(Math.floor((w * h) / 8000));
  }

  function generateStars(count) {
    const a = [];
    for (let i = 0; i < count; i++) {
      a.push({
        x: Math.random() * w,
        y: Math.random() * h,
        r: Math.random() * 1.3 + 0.2,
        v: Math.random() * 0.2 + 0.05,
        o: Math.random()
      });
    }
    return a;
  }

  function step() {
    ctx.clearRect(0, 0, w, h);
    for (const s of stars) {
      s.y += s.v * 0.25;
      if (s.y > h) s.y = 0;
      ctx.globalAlpha = 0.3 + 0.7 * Math.abs(Math.sin((s.x + s.y) * 0.001));
      const grad = ctx.createRadialGradient(s.x, s.y, 0, s.x, s.y, s.r * 4);
      grad.addColorStop(0, 'rgba(0,255,255,0.9)');
      grad.addColorStop(1, 'rgba(0,255,255,0)');
      ctx.fillStyle = grad;
      ctx.beginPath();
      ctx.arc(s.x, s.y, s.r * 2.2, 0, Math.PI * 2);
      ctx.fill();
    }
    requestAnimationFrame(step);
  }

  window.addEventListener('resize', resize);
  resize();
  step();
})();

// Custom cursor with small trail
(function initCursor() {
  const cursor = qs('#cursor');
  if (!cursor) return;
  let x = 0, y = 0, tx = 0, ty = 0;
  const speed = 0.22;
  function raf() {
    x += (tx - x) * speed;
    y += (ty - y) * speed;
    cursor.style.left = x + 'px';
    cursor.style.top = y + 'px';
    requestAnimationFrame(raf);
  }
  window.addEventListener('mousemove', (e) => { tx = e.clientX; ty = e.clientY; }, { passive: true });
  raf();
})();

// Hero parallax of HUD rings
(function parallaxHUD() {
  const rings = qsa('.hud .ring');
  if (!rings.length) return;
  window.addEventListener('mousemove', (e) => {
    const cx = window.innerWidth / 2;
    const cy = window.innerHeight / 2;
    const dx = (e.clientX - cx) / cx; // -1..1
    const dy = (e.clientY - cy) / cy;
    rings.forEach((ring, i) => {
      const depth = (i + 1) * 6;
      ring.style.transform = `translate(${dx * depth}px, ${dy * depth}px)`;
    });
  }, { passive: true });
})();

// Projects modal
(function modal() {
  const modal = qs('#project-modal');
  const title = qs('#modal-title');
  const desc = qs('#modal-desc');
  const demo = qs('#modal-demo');
  const closeBtn = qs('.modal-close', modal);
  const openers = qsa('.open-modal');

  function open(projectEl) {
    const card = projectEl.closest('.planet-card');
    const name = qs('h4', card).textContent.trim();
    title.textContent = name;
    desc.textContent = `More about ${name}. Tech stack, screenshots and my role.`;
    demo.href = '#';
    modal.setAttribute('aria-hidden', 'false');
    document.body.style.overflow = 'hidden';
  }
  function close() {
    modal.setAttribute('aria-hidden', 'true');
    document.body.style.overflow = '';
  }

  openers.forEach(b => b.addEventListener('click', (e) => { e.preventDefault(); open(e.currentTarget); }));
  modal.addEventListener('click', (e) => { if (e.target === modal) close(); });
  closeBtn.addEventListener('click', close);
  window.addEventListener('keydown', (e) => { if (e.key === 'Escape') close(); });
})();

// Contact form thank-you animation
(function contactForm() {
  const form = qs('#contact-form');
  const thank = qs('#thankyou');
  if (!form) return;
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const data = new FormData(form);
    const valid = data.get('name') && data.get('email') && data.get('message');
    if (!valid) return;
    thank.hidden = false;
    thank.animate([
      { opacity: 0, transform: 'translateY(6px)' },
      { opacity: 1, transform: 'translateY(0)' }
    ], { duration: 320, easing: 'ease-out' });
    form.reset();
  });
})();

// Smooth scroll for internal anchors (for older browsers and offset consistency)
qsa('a[href^="#"]').forEach(a => {
  a.addEventListener('click', (e) => {
    const id = a.getAttribute('href');
    const el = id && qs(id);
    if (!el) return;
    e.preventDefault();
    el.scrollIntoView({ behavior: 'smooth', block: 'start' });
  });
});

// Background audio toggle (graceful failure if file missing)
(function audioToggle() {
  const btn = qs('#audio-toggle');
  const audio = qs('#ambient');
  if (!btn || !audio) return;
  let enabled = false;
  btn.addEventListener('click', async () => {
    try {
      if (!enabled) {
        await audio.play();
        enabled = true;
        btn.setAttribute('aria-pressed', 'true');
        btn.textContent = '🔈';
      } else {
        audio.pause();
        enabled = false;
        btn.setAttribute('aria-pressed', 'false');
        btn.textContent = '🔊';
      }
    } catch (_) {
      // Ignore play errors (autoplay policy / missing asset)
    }
  });
})();


