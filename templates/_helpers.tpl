{{/*
Expand the name of the chart.
*/}}
{{- define "rhbk.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rhbk.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rhbk.labels" -}}
helm.sh/chart: {{ include "rhbk.chart" . }}
{{ include "rhbk.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rhbk.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rhbk.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Operator Label
*/}}
{{- define "rhbk.operatorLabel" -}}
{{- if .Values.namespace }}
operators.coreos.com/rhbk-operator.{{ .Values.namespace }}: ''
{{- else }}
operators.coreos.com/rhbk-operator.{{ .Values.name }}: ''
{{- end }}
{{- end }}
