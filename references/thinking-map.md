# Thinking models per stage

Thinking skills live in `${CLAUDE_PLUGIN_ROOT}/skills/thinking-<slug>/SKILL.md`. They are not invocable through the Skill tool. To apply one, read its SKILL.md and follow its procedure, then write its output into the artifact named below. Say which model you applied in one line, for example `Applied: pre-mortem.`

| Stage | Models (in order) | Where the output goes |
|---|---|---|
| new | first-principles, jobs-to-be-done | GOALS.md: Why and Success test |
| discuss | reversibility, opportunity-cost | CONTEXT.md: each D-NN carries one-way or two-way and what it costs |
| research | steel-manning, map-territory, lindy-effect | RESEARCH.md: strongest case for rejected options, advice vs reality gaps, how long an approach has survived |
| plan-check | pre-mortem, margin-of-safety, second-order | PLAN.md: Pre-mortem table, Buffers, side effects on other goals |
| checkin (drifting or blocked) | five-whys-plus, then theory-of-constraints | CHECKINS.md: Root cause, Adjustment |
| reflect | via-negativa | REFLECTION.md: Stop |
| anything else | model-router | Answer directly, cite the model used |

## Rules

- One model per step by default. A second model only when the first leaves a named blind spot.
- Use the model to change the artifact. A model that changes nothing is noise; drop it and say so.
- Keep the user's words. A model never overrides a locked decision (D-NN); it can only flag it.
- Short sessions: if the user says "quick", apply only the first model of the stage.
