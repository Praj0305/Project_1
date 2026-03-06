<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>First Quad Tech – Register</title>
font-family: 'Courier New', Courier, monospace;  /* replaces Space Mono */
font-family: 'Georgia', serif;                    /* replaces Syne */
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg: #0a0a0f;
      --card: #111118;
      --accent1: #b8ff3e;
      --accent2: #ff3eb8;
      --accent3: #3eb8ff;
      --text: #f0f0f0;
      --muted: #666680;
      --border: rgba(255,255,255,0.08);
    }

    body {
      background: var(--bg);
      color: var(--text);
      font-family: 'Space Mono', monospace;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow-x: hidden;
      position: relative;
    }

    /* Animated background blobs */
    body::before, body::after {
      content: '';
      position: fixed;
      border-radius: 50%;
      filter: blur(100px);
      opacity: 0.15;
      animation: blobFloat 8s ease-in-out infinite alternate;
      pointer-events: none;
      z-index: 0;
    }
    body::before {
      width: 500px; height: 500px;
      background: var(--accent2);
      top: -100px; left: -100px;
    }
    body::after {
      width: 400px; height: 400px;
      background: var(--accent3);
      bottom: -100px; right: -100px;
      animation-delay: -4s;
    }

    @keyframes blobFloat {
      from { transform: translate(0,0) scale(1); }
      to   { transform: translate(40px, 40px) scale(1.1); }
    }

    /* Noise texture overlay */
    .noise {
      position: fixed; inset: 0;
      background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.75' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
      pointer-events: none; z-index: 1; opacity: 0.4;
    }

    .wrapper {
      position: relative; z-index: 2;
      width: 100%; max-width: 520px;
      padding: 24px;
      animation: slideUp 0.7s cubic-bezier(0.16,1,0.3,1) both;
    }

    @keyframes slideUp {
      from { opacity:0; transform: translateY(40px); }
      to   { opacity:1; transform: translateY(0); }
    }

    /* Badge */
    .badge {
      display: inline-flex; align-items: center; gap: 8px;
      background: rgba(184,255,62,0.1);
      border: 1px solid rgba(184,255,62,0.3);
      color: var(--accent1);
      font-size: 11px; font-weight: 700; letter-spacing: 0.1em;
      padding: 6px 14px; border-radius: 100px;
      margin-bottom: 20px;
      text-transform: uppercase;
    }
    .badge .dot {
      width: 6px; height: 6px; border-radius: 50%;
      background: var(--accent1);
      animation: pulse 1.5s ease-in-out infinite;
    }
    @keyframes pulse {
      0%,100% { opacity:1; transform:scale(1); }
      50%      { opacity:0.4; transform:scale(1.5); }
    }

    h1 {
      font-family: 'Syne', sans-serif;
      font-size: clamp(28px, 6vw, 40px);
      font-weight: 800;
      line-height: 1.1;
      margin-bottom: 8px;
      background: linear-gradient(135deg, #fff 0%, var(--muted) 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    h1 span {
      background: linear-gradient(135deg, var(--accent1), var(--accent3));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .subtitle {
      color: var(--muted);
      font-size: 13px;
      margin-bottom: 32px;
      line-height: 1.6;
    }

    /* Card */
    .card {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 24px;
      padding: 32px;
      position: relative;
      overflow: hidden;
    }

    .card::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 1px;
      background: linear-gradient(90deg, transparent, var(--accent1), var(--accent2), transparent);
      opacity: 0.6;
    }

    /* Form fields */
    .field {
      margin-bottom: 20px;
      animation: fadeIn 0.5s ease both;
    }
    .field:nth-child(1) { animation-delay: 0.1s; }
    .field:nth-child(2) { animation-delay: 0.15s; }
    .field:nth-child(3) { animation-delay: 0.2s; }
    .field:nth-child(4) { animation-delay: 0.25s; }
    .field:nth-child(5) { animation-delay: 0.3s; }

    @keyframes fadeIn {
      from { opacity:0; transform: translateX(-10px); }
      to   { opacity:1; transform: translateX(0); }
    }

    label {
      display: block;
      font-size: 11px;
      font-weight: 700;
      letter-spacing: 0.1em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 8px;
    }

    .input-wrap {
      position: relative;
    }

    .input-icon {
      position: absolute;
      left: 14px; top: 50%;
      transform: translateY(-50%);
      font-size: 16px;
      pointer-events: none;
    }

    input {
      width: 100%;
      background: rgba(255,255,255,0.04);
      border: 1px solid var(--border);
      border-radius: 12px;
      color: var(--text);
      font-family: 'Space Mono', monospace;
      font-size: 14px;
      padding: 14px 16px 14px 44px;
      transition: border-color 0.2s, background 0.2s, box-shadow 0.2s;
      outline: none;
    }

    input::placeholder { color: var(--muted); }

    input:focus {
      border-color: var(--accent1);
      background: rgba(184,255,62,0.04);
      box-shadow: 0 0 0 3px rgba(184,255,62,0.1);
    }

    input:focus + .focus-line { transform: scaleX(1); }

    /* Divider */
    .divider {
      display: flex; align-items: center; gap: 12px;
      margin: 8px 0 20px;
      color: var(--muted); font-size: 11px; letter-spacing: 0.08em;
    }
    .divider::before, .divider::after {
      content: '';
      flex: 1; height: 1px;
      background: var(--border);
    }

    /* Submit button */
    .btn-register {
      width: 100%;
      background: var(--accent1);
      color: #0a0a0f;
      border: none;
      border-radius: 12px;
      font-family: 'Syne', sans-serif;
      font-size: 16px;
      font-weight: 800;
      padding: 16px;
      cursor: pointer;
      letter-spacing: 0.05em;
      text-transform: uppercase;
      transition: transform 0.15s, box-shadow 0.15s, background 0.2s;
      position: relative;
      overflow: hidden;
      margin-top: 8px;
    }

    .btn-register::after {
      content: '';
      position: absolute; inset: 0;
      background: linear-gradient(135deg, rgba(255,255,255,0.2), transparent);
      opacity: 0;
      transition: opacity 0.2s;
    }

    .btn-register:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 30px rgba(184,255,62,0.35);
    }
    .btn-register:hover::after { opacity: 1; }
    .btn-register:active { transform: translateY(0); }

    /* Sign in link */
    .signin-row {
      text-align: center;
      margin-top: 24px;
      font-size: 13px;
      color: var(--muted);
    }
    .signin-row a {
      color: var(--accent3);
      text-decoration: none;
      font-weight: 700;
      transition: color 0.2s;
    }
    .signin-row a:hover { color: var(--accent1); }

    /* Terms */
    .terms {
      font-size: 11px;
      color: var(--muted);
      margin-top: 16px;
      text-align: center;
      line-height: 1.6;
    }
    .terms a { color: var(--accent2); text-decoration: none; }
    .terms a:hover { text-decoration: underline; }

    /* Footer thank you */
    .thankyou {
      text-align: center;
      margin-top: 28px;
      font-family: 'Syne', sans-serif;
      font-size: 13px;
      color: var(--muted);
      letter-spacing: 0.1em;
    }
    .thankyou span {
      background: linear-gradient(135deg, var(--accent1), var(--accent2));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      font-weight: 800;
    }

    /* Tag pills */
    .tags {
      display: flex; flex-wrap: wrap; gap: 8px;
      margin-bottom: 28px;
    }
    .tag {
      font-size: 11px;
      padding: 4px 12px;
      border-radius: 100px;
      border: 1px solid var(--border);
      color: var(--muted);
      letter-spacing: 0.05em;
    }
    .tag.a1 { border-color: rgba(184,255,62,0.3); color: var(--accent1); }
    .tag.a2 { border-color: rgba(255,62,184,0.3); color: var(--accent2); }
    .tag.a3 { border-color: rgba(62,184,255,0.3); color: var(--accent3); }
  </style>
</head>
<body>
  <div class="noise"></div>

  <div class="wrapper">
    <div class="badge"><span class="dot"></span> First Quad Tech Solution</div>

    <h1>Learn <span>DevOps</span><br/>the right way.</h1>
    <p class="subtitle">Create your account and start your journey. No cap. 🚀</p>

    <div class="tags">
      <span class="tag a1">#DevOps</span>
      <span class="tag a2">#CloudComputing</span>
      <span class="tag a3">#Jenkins</span>
      <span class="tag">#Docker</span>
      <span class="tag">#AWS</span>
    </div>

    <div class="card">
      <form action="action_page.php" method="POST">

        <div class="field">
          <label for="Name">Full Name</label>
          <div class="input-wrap">
            <span class="input-icon">👤</span>
            <input type="text" id="Name" name="Name" placeholder="e.g. Alex Johnson" required />
          </div>
        </div>

        <div class="field">
          <label for="mobile">Mobile Number</label>
          <div class="input-wrap">
            <span class="input-icon">📱</span>
            <input type="tel" id="mobile" name="mobile" placeholder="+91 98765 43210" required />
          </div>
        </div>

        <div class="field">
          <label for="email">Email Address</label>
          <div class="input-wrap">
            <span class="input-icon">✉️</span>
            <input type="email" id="email" name="email" placeholder="you@email.com" required />
          </div>
        </div>

        <div class="divider">security</div>

        <div class="field">
          <label for="psw">Password</label>
          <div class="input-wrap">
            <span class="input-icon">🔒</span>
            <input type="password" id="psw" name="psw" placeholder="Make it strong!" required />
          </div>
        </div>

        <div class="field">
          <label for="psw-repeat">Confirm Password</label>
          <div class="input-wrap">
            <span class="input-icon">🔑</span>
            <input type="password" id="psw-repeat" name="psw-repeat" placeholder="Same as above" required />
          </div>
        </div>

        <button type="submit" class="btn-register">Create Account →</button>

        <p class="terms">
          By registering, you agree to our <a href="#">Terms</a> & <a href="#">Privacy Policy</a>.
        </p>
      </form>
    </div>

    <p class="signin-row">Already have an account? <a href="#">Sign in here</a></p>

    <p class="thankyou">✌️ <span>Happy Learning!</span> You got this.</p>
  </div>

  <script>
    // Password match validation
    const form = document.querySelector('form');
    form.addEventListener('submit', (e) => {
      const p1 = document.getElementById('psw').value;
      const p2 = document.getElementById('psw-repeat').value;
      if (p1 !== p2) {
        e.preventDefault();
        document.getElementById('psw-repeat').style.borderColor = '#ff3eb8';
        document.getElementById('psw-repeat').style.boxShadow = '0 0 0 3px rgba(255,62,184,0.15)';
        document.getElementById('psw-repeat').placeholder = "❌ Passwords don't match!";
      }
    });
  </script>
</body>
</html>
