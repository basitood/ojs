{**
 * submission.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show the details of a submission.
 *
 *
 * $Id$
 *}

{assign_translate var="pageTitleTranslated" key="submission.page.editing" id=$submission->getArticleId()}
{assign var="pageCrumbTitle" value="submission.editing"}

{include file="common/header.tpl"}

{include file="proofreader/submission/summary.tpl"}

<div class="separator"></div>

{include file="proofreader/submission/layout.tpl"}

<div class="separator"></div>

<h3>{translate key="submission.proofreading"}</h3>

<!-- START AUTHOR COMMENTS -->
<table width="100%" class="info">
	<tr valign="top">
		<td>&nbsp;</td>
		<td class="heading" width="15%">{translate key="submission.request"}</td>
		<td class="heading" width="15%">{translate key="submission.underway"}</td>
		<td class="heading" width="15%">{translate key="submission.complete"}</td>
	</tr>
	<tr valign="top">
		<td width="55%">
			1. {translate key="editor.article.authorComments"}&nbsp;
		</td>
		<td width="15%">{if $proofAssignment->getDateAuthorNotified()}{$proofAssignment->getDateAuthorNotified()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td width="15%">{if $proofAssignment->getDateAuthorUnderway()}{$proofAssignment->getDateAuthorUnderway()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td width="15%">{if $proofAssignment->getDateAuthorCompleted()}{$proofAssignment->getDateAuthorCompleted()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
	</tr>
<!-- END AUTHOR COMMENTS -->
<!-- START PROOFREADER COMMENTS -->
	<tr valign="top">
		<td width="55%">
			2. {translate key="editor.article.proofreaderComments"}&nbsp;
		</td>
		<td width="15%">{if $proofAssignment->getDateProofreaderNotified()}{$proofAssignment->getDateProofreaderNotified()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td width="15%">{if $proofAssignment->getDateProofreaderUnderway()}{$proofAssignment->getDateProofreaderUnderway()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td width="15%">
			{if not $proofAssignment->getDateProofreaderNotified() or not $useProofreaders or $proofAssignment->getDateProofreaderCompleted()}
				{icon name="mail" disabled="disabled" url="$requestPageUrl/completeProofreader?articleId=`$submission->getArticleId()`"}
			{else}
				{icon name="mail" url="$requestPageUrl/completeProofreader?articleId=`$submission->getArticleId()`"}
			{/if}
			{if $proofAssignment->getDateProofreaderCompleted()}{$proofAssignment->getDateProofreaderCompleted()|date_format:$dateFormatShort}{/if}
		</td>
	</tr>
<!-- END PROOFREADER COMMENTS -->
<!-- START LAYOUT EDITOR FINAL -->
	<tr valign="top">
		<td width="55%">
			3. {translate key="editor.article.layoutEditorFinal"}
		</td>
		<td width="15%">{if $proofAssignment->getDateLayoutEditorNotified()}{$proofAssignment->getDateLayoutEditorNotified()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td width="15%">{if $proofAssignment->getDateLayoutEditorUnderway()}{$proofAssignment->getDateLayoutEditorUnderway()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
		<td width="15%">{if $proofAssignment->getDateLayoutEditorCompleted()}{$proofAssignment->getDateLayoutEditorCompleted()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
	</tr>
<!-- END LAYOUT EDITOR FINAL -->
</table>
{translate key="submission.proofread.corrections"}
{if $submission->getMostRecentProofreadComment()}
	{assign var="comment" value=$submission->getMostRecentProofreadComment()}
	<a href="javascript:openComments('{$requestPageUrl}/viewProofreadComments/{$submission->getArticleId()}#{$comment->getCommentId()}');" class="icon">{icon name="comment"}</a>{$comment->getDatePosted()|date_format:$dateFormatShort}
{else}
	<a href="javascript:openComments('{$requestPageUrl}/viewProofreadComments/{$submission->getArticleId()}');" class="icon">{icon name="comment"}</a>
{/if}

<div class="separator"></div>

{include file="common/footer.tpl"}
