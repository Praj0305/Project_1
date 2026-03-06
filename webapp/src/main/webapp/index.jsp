<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>First Quad Tech - Register</title>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --cream: #f5f0e8;
      --warm-white: #faf8f4;
      --gold: #c9a84c;
      --gold-light: #e8c97a;
      --gold-dark: #a07830;
      --ink: #1a1612;
      --ink-soft: #3d3530;
      --muted: #8c7f72;
      --border: #d8cfc4;
      --border-light: #ede7dd;
      --shadow: rgba(26,22,18,0.12);
    }

    body {
      background: var(--cream);
      color: var(--ink);
      font-family: Georgia, 'Times New Roman', serif;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      overflow-x: hidden;
    }

    /* Subtle grid background */
    body::before {
      content: '';
      position: fixed; inset: 0;
      background-image:
        linear-gradient(var(--border-light) 1px, transparent 1px),
        linear-gradient(90deg, var(--border-light) 1px, transparent 1px);
      background-size: 40px 40px;
      opacity: 0.5;
      pointer-events: none;
      z-index: 0;
    }

    /* Corner ornaments */
    body::after {
      content: '';
      position: fixed;
      top: 20px; left: 20px;
      width: 120px; height: 120px;
      border-top: 2px solid var(--gold);
      border-left: 2px solid var(--gold);
      opacity: 0.4;
      pointer-events: none;
      z-index: 0;
    }

    .corner-br {
      position: fixed;
      bottom: 20px; right: 20px;
      width: 120px; height: 120px;
      border-bottom: 2px solid var(--gold);
      border-right: 2px solid var(--gold);
      opacity: 0.4;
      pointer-events: none;
      z-index: 0;
    }

    .wrapper {
      position: relative; z-index: 1;
      width: 100%; max-width: 560px;
      padding: 32px 24px;
      animation: fadeUp 0.8s ease both;
    }

    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(24px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    /* Header section */
    .header {
      text-align: center;
      margin-bottom: 36px;
    }

    .monogram {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 64px; height: 64px;
      border: 2px solid var(--gold);
      border-radius: 50%;
      margin-bottom: 20px;
      font-family: Georgia, serif;
      font-size: 22px;
      font-weight: bold;
      color: var(--gold-dark);
      background: var(--warm-white);
      box-shadow: 0 0 0 6px var(--cream), 0 0 0 7px var(--border);
      letter-spacing: 1px;
    }

    .rule {
      display: flex;
      align-items: center;
      gap: 12px;
      margin: 0 auto 16px;
      max-width: 340px;
    }
    .rule::before, .rule::after {
      content: '';
      flex: 1;
      height: 1px;
      background: linear-gradient(90deg, transparent, var(--gold), transparent);
    }
    .rule-diamond {
      width: 6px; height: 6px;
      background: var(--gold);
      transform: rotate(45deg);
      flex-shrink: 0;
    }

    h1 {
      font-family: Georgia, 'Times New Roman', serif;
      font-size: clamp(24px, 5vw, 34px);
      font-weight: normal;
      color: var(--ink);
      letter-spacing: 0.04em;
      line-height: 1.2;
      margin-bottom: 8px;
    }

    h1 em {
      font-style: italic;
      color: var(--gold-dark);
    }

    .institution {
      font-family: Georgia, serif;
      font-size: 11px;
      letter-spacing: 0.25em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 6px;
    }

    .subtitle {
      font-size: 14px;
      color: var(--muted);
      font-style: italic;
      line-height: 1.6;
    }

    /* Card */
    .card {
      background: var(--warm-white);
      border: 1px solid var(--border);
      border-radius: 4px;
      padding: 40px;
      position: relative;
      box-shadow:
        0 1px 3px var(--shadow),
        0 8px 32px rgba(26,22,18,0.06),
        inset 0 1px 0 rgba(255,255,255,0.8);
    }

    /* Inner border decoration */
    .card::before {
      content: '';
      position: absolute;
      inset: 8px;
      border: 1px solid var(--border-light);
      border-radius: 2px;
      pointer-events: none;
    }

    .card-title {
      font-size: 10px;
      letter-spacing: 0.3em;
      text-transform: uppercase;
      color: var(--gold-dark);
      text-align: center;
      margin-bottom: 28px;
      font-family: Georgia, serif;
    }

    /* Fields */
    .field {
      margin-bottom: 22px;
      animation: fadeIn 0.5s ease both;
    }
    .field:nth-child(1) { animation-delay: 0.1s; }
    .field:nth-child(2) { animation-delay: 0.18s; }
    .field:nth-child(3) { animation-delay: 0.26s; }
    .field:nth-child(4) { animation-delay: 0.34s; }
    .field:nth-child(5) { animation-delay: 0.42s; }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(8px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    label {
      display: block;
      font-size: 10px;
      letter-spacing: 0.2em;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 7px;
      font-family: Georgia, serif;
    }

    input {
      width: 100%;
      background: var(--cream);
      border: 1px solid var(--border);
      border-bottom: 2px solid var(--border);
      border-radius: 2px;
      color: var(--ink);
      font-family: Georgia, 'Times New Roman', serif;
      font-size: 15px;
      padding: 12px 16px;
      transition: border-color 0.2s, box-shadow 0.2s, background 0.2s;
      outline: none;
    }

    input::placeholder {
      color: var(--border);
      font-style: italic;
    }

    input:focus {
      border-color: var(--gold);
      border-bottom-color: var(--gold-dark);
      background: var(--warm-white);
      box-shadow: 0 4px 12px rgba(201,168,76,0.12);
    }

    /* Section divider */
    .section-divider {
      display: flex;
      align-items: center;
      gap: 10px;
      margin: 28px 0;
      color: var(--muted);
      font-size: 9px;
      letter-spacing: 0.3em;
      text-transform: uppercase;
      font-family: Georgia, serif;
    }
    .section-divider::before, .section-divider::after {
      content: '';
      flex: 1; height: 1px;
      background: var(--border);
    }

    /* Two column layout for passwords */
    .field-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 16px;
    }

    /* Submit button */
    .btn-register {
      width: 100%;
      background: var(--ink);
      color: var(--cream);
      border: 1px solid var(--ink);
      border-radius: 2px;
      font-family: Georgia, 'Times New Roman', serif;
      font-size: 12px;
      font-weight: normal;
      letter-spacing: 0.3em;
      text-transform: uppercase;
      padding: 16px;
      cursor: pointer;
      transition: background 0.2s, color 0.2s, box-shadow 0.2s, transform 0.15s;
      margin-top: 12px;
      position: relative;
    }

    .btn-register::before {
      content: '';
      position: absolute;
      inset: 3px;
      border: 1px solid rgba(255,255,255,0.1);
      border-radius: 1px;
      pointer-events: none;
    }

    .btn-register:hover {
      background: var(--gold-dark);
      border-color: var(--gold-dark);
      box-shadow: 0 4px 20px rgba(160,120,48,0.3);
      transform: translateY(-1px);
    }

    .btn-register:active {
      transform: translateY(0);
    }

    /* Bottom links */
    .card-footer {
      margin-top: 24px;
      text-align: center;
    }

    .terms {
      font-size: 11px;
      color: var(--muted);
      font-style: italic;
      line-height: 1.7;
    }
    .terms a {
      color: var(--gold-dark);
      text-decoration: none;
      border-bottom: 1px solid var(--gold-light);
    }
    .terms a:hover { color: var(--gold); }

    .signin-row {
      margin-top: 16px;
      font-size: 12px;
      color: var(--muted);
      letter-spacing: 0.05em;
    }
    .signin-row a {
      color: var(--ink);
      text-decoration: none;
      font-weight: bold;
      border-bottom: 1px solid var(--border);
      padding-bottom: 1px;
      transition: border-color 0.2s, color 0.2s;
    }
    .signin-row a:hover {
      color: var(--gold-dark);
      border-color: var(--gold);
    }

    /* Tags */
    .tags {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 8px;
      margin-top: 28px;
    }
    .tag {
      font-size: 10px;
      letter-spacing: 0.15em;
      text-transform: uppercase;
      padding: 4px 14px;
      border: 1px solid var(--border);
      border-radius: 2px;
      color: var(--muted);
      font-family: Georgia, serif;
      transition: border-color 0.2s, color 0.2s;
    }
    .tag:hover {
      border-color: var(--gold);
      color: var(--gold-dark);
    }

    /* Footer */
    .footer-text {
      text-align: center;
      margin-top: 24px;
      font-size: 11px;
      color: var(--muted);
      font-style: italic;
      letter-spacing: 0.08em;
    }

    @media (max-width: 500px) {
      .card { padding: 28px 20px; }
      .field-row { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>
  <div class="corner-br"></div>

  <div class="wrapper">

    <div class="header">
      <div class="monogram">FQ</div>
      <p class="institution">First Quad Tech Solution</p>
      <div class="rule"><div class="rule-diamond"></div></div>
      <h1>Begin Your <em>DevOps</em> Journey</h1>
      <p class="subtitle">Create an account to access our learning platform</p>
    </div>

    <div class="card">
      <p class="card-title">New Member Registration</p>

      <form action="action_page.php" method="POST">

        <div class="field">
          <label for="Name">Full Name</label>
          <input type="text" id="Name" name="Name" placeholder="Your full name" required />
        </div>

        <div class="field">
          <label for="mobile">Mobile Number</label>
          <input type="tel" id="mobile" name="mobile" placeholder="+91 00000 00000" required />
        </div>

        <div class="field">
          <label for="email">Email Address</label>
          <input type="email" id="email" name="email" placeholder="your@email.com" required />
        </div>

        <div class="section-divider">Security Credentials</div>

        <div class="field-row">
          <div class="field">
            <label for="psw">Password</label>
            <input type="password" id="psw" name="psw" placeholder="Enter password" required />
          </div>
          <div class="field">
            <label for="psw-repeat">Confirm</label>
            <input type="password" id="psw-repeat" name="psw-repeat" placeholder="Repeat password" required />
          </div>
        </div>

        <button type="submit" class="btn-register">Create Account</button>

        <div class="card-footer">
          <p class="terms">
            By registering, you agree to our <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>.
          </p>
          <p class="signin-row">
            Already have an account? <a href="#">Sign in here</a>
          </p>
        </div>

      </form>
    </div>

    <div class="tags">
      <span class="tag">DevOps</span>
      <span class="tag">Cloud</span>
      <span class="tag">Jenkins</span>
      <span class="tag">Docker</span>
      <span class="tag">AWS</span>
    </div>

    <p class="footer-text">Happy Learning &mdash; First Quad Tech Solution</p>

  </div>

  <script>
    var form = document.querySelector('form');
    form.addEventListener('submit', function(e) {
      var p1 = document.getElementById('psw').value;
      var p2 = document.getElementById('psw-repeat').value;
      if (p1 !== p2) {
        e.preventDefault();
        var confirmField = document.getElementById('psw-repeat');
        confirmField.style.borderColor = '#c0392b';
        confirmField.style.boxShadow = '0 4px 12px rgba(192,57,43,0.15)';
        confirmField.placeholder = 'Passwords do not match';
        confirmField.value = '';
        confirmField.focus();
      }
    });
  </script>
</body>
</html>
