{{/* Quantumics Application helm chart includes UI and Service Layer Application. */}}


{{/* ----------------------- Common Definitions (START) --------------- */}}


{{/* ----------------------- Common Definitions (END) ----------------- */}}



{{/* ----------------------- Quantumics UI (START) ---------------------------- */}}

{{/* Quantumics UI -- Expand the name of the chart. */}}
{{- define "qs-ui.name" -}}
{{- default .Values.nameOverrideUI | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "qs-ui.fullname" -}}
{{- if .Values.fullnameOverrideUI }}
{{- .Values.fullnameOverrideUI | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Values.nameOverrideUI }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Quantumics UI -- Custom chart label and version as used by the chart label.
*/}}
{{- define "qs-ui.chart" -}}
{{- printf "%s-%s" .Values.chartLabelUI .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Quantumics UI -- Selector labels
*/}}
{{- define "qs-ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "qs-ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Quantumics UI -- labels
*/}}
{{- define "qs-ui.labels" -}}
helm.sh/chart: {{ include "qs-ui.chart" . }}
{{ include "qs-ui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Quantumics UI -- Create the name of the service account to use
*/}}
{{- define "qs-ui.serviceAccountName" -}}
{{- if .Values.serviceAccountUI.create }}
{{- default (include "qs-ui.fullname" .) .Values.serviceAccountUI.name }}
{{- else }}
{{- default "default" .Values.serviceAccountUI.name }}
{{- end }}
{{- end }}



{{/* ----------------------- Quantumics UI (END) ---------------------------- */}}




{{/* ----------------------- Quantumics Service Layer (START) --------------- */}}


{{/* Quantumics SL -- Expand the name of the chart. */}}
{{- define "qs-sl.name" -}}
{{- default .Values.nameOverrideSL | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "qs-sl.fullname" -}}
{{- if .Values.fullnameOverrideSL }}
{{- .Values.fullnameOverrideSL | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Values.nameOverrideSL }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Quantumics SL -- Custom chart label and version as used by the chart label.
*/}}
{{- define "qs-sl.chart" -}}
{{- printf "%s-%s" .Values.chartLabelSL .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Quantumics SL -- Selector labels
*/}}
{{- define "qs-sl.selectorLabels" -}}
app.kubernetes.io/name: {{ include "qs-sl.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Quantumics SL -- Labels
*/}}
{{- define "qs-sl.labels" -}}
helm.sh/chart: {{ include "qs-sl.chart" . }}
{{ include "qs-sl.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Quantumics SL -- Create the name of the service account to use
*/}}
{{- define "qs-sl.serviceAccountName" -}}
{{- if .Values.serviceAccountSL.create }}
{{- default (include "qs-sl.fullname" .) .Values.serviceAccountSL.name }}
{{- else }}
{{- default "default" .Values.serviceAccountSL.name }}
{{- end }}
{{- end }}


{{/* ----------------------- Quantumics Service Layer (END) --------------- */}}