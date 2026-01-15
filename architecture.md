# Architecture

This document describes the high-level system architecture, data flow, and component relationships for YouTube Thumbnail Lab.

## System Overview

YouTube Thumbnail Lab is a Next.js application that generates YouTube thumbnails using Google's Gemini 3 Pro Image API. The app follows a simple client-server architecture with API routes handling AI interactions.

## Data Flow

## Component Architecture

### Frontend Components
- `thumbnail-generator.tsx` – Main orchestrator with gallery-based thumbnail management
- `prompt-form.tsx` – Input form with validation and prompt style selector (Original/Enhanced)
- `thumbnail-input-tabs.tsx` – Tab UI for switching between Generate and Upload modes
- `thumbnail-gallery.tsx` – Grid display of thumbnails with source badges and actions
- `thumbnail-preview.tsx` – Single thumbnail preview with download and YouTube preview
- `thumbnail-grid.tsx` – Batch generation grid showing 3 thumbnail slots
- `thumbnail-card.tsx` – Individual thumbnail card with regenerate/download actions
- `image-upload.tsx` – Drag-and-drop image upload with validation
- `youtube-preview/` – YouTube homepage preview modal components:
  - `youtube-homepage-modal.tsx` – Modal with mock YouTube layout supporting multiple thumbnails
  - `youtube-video-card.tsx` – Individual video card matching YouTube design
  - `mock-videos.ts` – Static data with real YouTuber video IDs

### API Layer
- `/api/generate` – Single endpoint handling prompt enhancement and image generation

### Library Modules
- `lib/gemini.ts` – Gemini API client configuration
- `lib/prompt-enhancer.ts` – Dual-mode prompt enhancement system:
  - **Original mode**: Simple 4-line YouTube-optimized prompt (default)
  - **Enhanced mode**: Category detection + detailed narrative prompts with photographic/cinematic language
  - Detects 7 content categories: tutorial, news, review, entertainment, vlog, tech, general
- `lib/types.ts` – TypeScript types for thumbnails, batch state, and gallery
- `lib/utils.ts` – Shared utilities (cn helper, downloadThumbnail, image validation, ID generation)
- `lib/download-zip.ts` – ZIP archive creation for batch thumbnail downloads
