package com.vkontakte.android.ui;

import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.KeyEvent;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.ui.WriteBar;
import com.vkontakte.android.ui.widget.RichEditText;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashSet;
/* loaded from: classes3.dex */
public class MentionsManager implements RichEditText.OnKeyPreImeListener {
    private static final int EDIT_THRESHOLD_MS = 300;
    private static final String STR_FRM = "[id%d|%s]";
    private static final String mentionPrefixAt = "@";
    private static final String mentionPrefixStar = "*";
    private RichEditText editText;
    private MentionSpan pendingSpan;
    private long pendingSpanTime;
    private WriteBar.MentionSuggestionsSupplier suggestionsSupplier;
    private HashSet<Character> wordSeparators = new HashSet<>(Arrays.asList(' ', ',', ';', '.', '!', '?', '-', '\n', '(', ')', '[', ']'));

    public MentionsManager(final RichEditText editText, final WriteBar.MentionSuggestionsSupplier suggestionsSupplier) {
        this.editText = editText;
        this.suggestionsSupplier = suggestionsSupplier;
        editText.onKeyPreImeListener = this;
        editText.addTextChangedListener(new TextWatcher() { // from class: com.vkontakte.android.ui.MentionsManager.1
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                Log.v("MentionsManager", "beforeTextChanged, s = " + s.toString() + ", start = " + start + ", count = " + count + ", after = " + after);
                int[] ind = MentionsManager.this.getCurrentWordBoundaries();
                if (after == 0 && count > 0 && start == ind[0] && start + count == ind[1]) {
                    MentionSpan[] spans = (MentionSpan[]) editText.getEditableText().getSpans(ind[0], ind[1], MentionSpan.class);
                    if (spans.length == 1 && editText.getEditableText().getSpanStart(spans[0]) == start && editText.getEditableText().getSpanEnd(spans[0]) == start + count) {
                        MentionsManager.this.pendingSpan = spans[0];
                        MentionsManager.this.pendingSpanTime = System.currentTimeMillis();
                    }
                }
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                Log.v("MentionsManager", "onTextChanged, s = " + s.toString() + ", start = " + start + ", before = " + before + ", count = " + count);
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                String currentWord = MentionsManager.this.getCurrentWord();
                Log.v("MentionsManager", "afterTextChanged, currentWord = " + currentWord);
                if (currentWord.startsWith(MentionsManager.mentionPrefixAt) || currentWord.startsWith("*")) {
                    suggestionsSupplier.showMentionSuggestionsFor(currentWord.substring(1));
                    int[] boundaries = MentionsManager.this.getCurrentWordBoundaries();
                    for (MentionSpan span : (MentionSpan[]) s.getSpans(boundaries[0], boundaries[1], MentionSpan.class)) {
                        s.removeSpan(span);
                    }
                    int id = suggestionsSupplier.findExactMatch(currentWord.substring(1));
                    if (id != 0) {
                        MentionSpan span2 = new MentionSpan();
                        span2.id = id;
                        s.setSpan(span2, boundaries[0], boundaries[1], 33);
                        return;
                    }
                    return;
                }
                suggestionsSupplier.hideMentionSuggestions();
                int[] ind = MentionsManager.this.getCurrentWordBoundaries();
                android.util.Log.v("MentionsManager", "Current word [" + ind[0] + "," + ind[1] + "]");
                MentionSpan[] spans = (MentionSpan[]) s.getSpans(ind[0], ind[1], MentionSpan.class);
                android.util.Log.v("MentionsManager", "totally " + spans.length + " spans");
                if (spans.length == 0 && MentionsManager.this.pendingSpan != null && ind[0] < ind[1] && System.currentTimeMillis() - MentionsManager.this.pendingSpanTime < 300) {
                    s.setSpan(MentionsManager.this.pendingSpan, ind[0], ind[1], 33);
                    MentionsManager.this.pendingSpan = null;
                } else if (spans.length == 1) {
                    MentionSpan span3 = spans[0];
                    int start = s.getSpanStart(span3);
                    int end = s.getSpanEnd(span3);
                    int updatedStart = ind[0];
                    int updatedEnd = ind[1];
                    android.util.Log.v("MentionsManager", "start = " + start + ", end = " + end + ", updatedStart = " + updatedStart + " updatedEnd = " + updatedEnd);
                    if (updatedStart < start || updatedEnd > end) {
                        s.removeSpan(span3);
                        s.setSpan(span3, updatedStart, updatedEnd, 33);
                    }
                } else if (spans.length > 1) {
                    for (MentionSpan ms : spans) {
                        editText.getEditableText().removeSpan(ms);
                    }
                }
            }
        });
    }

    public void mentionSelected(UserProfile up) {
        this.suggestionsSupplier.hideMentionSuggestions();
        int[] boundaries = getCurrentWordBoundaries();
        this.editText.getEditableText().replace(boundaries[0], boundaries[1], up.firstName);
        MentionSpan span = new MentionSpan();
        span.id = up.uid;
        this.editText.getEditableText().setSpan(span, boundaries[0], boundaries[0] + up.firstName.length(), 33);
    }

    public String getMentionsForSerialization() {
        Editable editable = this.editText.getEditableText();
        MentionSpan[] spans = (MentionSpan[]) editable.getSpans(0, editable.length(), MentionSpan.class);
        ArrayList<Integer> data = new ArrayList<>(spans.length * 3);
        for (int i = 0; i < spans.length; i++) {
            data.add(Integer.valueOf(editable.getSpanStart(spans[i])));
            data.add(Integer.valueOf(spans[i].id));
            data.add(Integer.valueOf(editable.getSpanEnd(spans[i])));
        }
        return TextUtils.join(",", data.toArray());
    }

    public void setMentionsFromSerializedString(String data) {
        try {
            String[] splitData = data.split(",");
            for (int i = 0; i < splitData.length; i += 3) {
                int spanStart = Integer.parseInt(splitData[i]);
                int id = Integer.parseInt(splitData[i + 1]);
                int spanEnd = Integer.parseInt(splitData[i + 2]);
                MentionSpan ms = new MentionSpan();
                ms.id = id;
                if (this.editText.getEditableText().length() >= spanEnd) {
                    this.editText.getEditableText().setSpan(ms, spanStart, spanEnd, 33);
                }
            }
        } catch (Exception exc) {
            Log.e("MentionsManager", "setMentionsFromSerializedString failed data = " + data, exc);
        }
    }

    public String getAsFormattedString() {
        return getAsStringWithFrm(STR_FRM);
    }

    private String getAsStringWithFrm(String frmStr) {
        final Editable editable = this.editText.getEditableText();
        MentionSpan[] spans = (MentionSpan[]) editable.getSpans(0, editable.length(), MentionSpan.class);
        Arrays.sort(spans, new Comparator<MentionSpan>() { // from class: com.vkontakte.android.ui.MentionsManager.2
            @Override // java.util.Comparator
            public int compare(MentionSpan o1, MentionSpan o2) {
                return editable.getSpanStart(o1) - editable.getSpanStart(o2);
            }
        });
        StringBuilder builder = new StringBuilder(editable);
        int delta = 0;
        for (MentionSpan span : spans) {
            int start = editable.getSpanStart(span);
            int end = editable.getSpanEnd(span);
            String mentionName = editable.subSequence(start, end).toString();
            if (mentionName.startsWith(mentionPrefixAt) || mentionName.startsWith("*")) {
                int indOfOpeningBrackets = editable.toString().indexOf(40, end);
                int indOfClosingBrackets = editable.toString().indexOf(41, end);
                if (indOfClosingBrackets >= 0 && indOfOpeningBrackets >= 0 && indOfClosingBrackets - indOfOpeningBrackets > 1 && editable.toString().substring(end, indOfOpeningBrackets).trim().length() == 0 && ((MentionSpan[]) editable.getSpans(indOfOpeningBrackets, indOfClosingBrackets, MentionSpan.class)).length == 0) {
                    end = indOfClosingBrackets + 1;
                    mentionName = editable.subSequence(indOfOpeningBrackets + 1, indOfClosingBrackets).toString();
                }
            }
            String substituteStr = String.format(frmStr, Integer.valueOf(span.id), mentionName.trim());
            builder.replace(start + delta, end + delta, substituteStr);
            delta += substituteStr.length() - (end - start);
        }
        return builder.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getCurrentWord() {
        int[] indexes = getCurrentWordBoundaries();
        int indStart = indexes[0];
        int indEnd = indexes[1];
        if (indEnd > indStart) {
            char[] chars = new char[indEnd - indStart];
            this.editText.getText().getChars(indStart, indEnd, chars, 0);
            return new String(chars);
        }
        return "";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int[] getCurrentWordBoundaries() {
        int currentInd = this.editText.getSelectionStart();
        int[] indexes = new int[2];
        int indStart = currentInd;
        int indEnd = currentInd;
        while (indStart > 0 && !this.wordSeparators.contains(Character.valueOf(this.editText.getText().charAt(indStart - 1)))) {
            indStart--;
        }
        while (indEnd < this.editText.length() && !this.wordSeparators.contains(Character.valueOf(this.editText.getText().charAt(indEnd)))) {
            indEnd++;
        }
        indexes[0] = indStart;
        indexes[1] = indEnd;
        return indexes;
    }

    @Override // com.vkontakte.android.ui.widget.RichEditText.OnKeyPreImeListener
    public boolean onKeyPreIme(int keyCode, KeyEvent event) {
        if (!this.suggestionsSupplier.getIsShowingMentionsSuggestions() || keyCode != 4) {
            return false;
        }
        this.suggestionsSupplier.hideMentionSuggestions();
        return true;
    }
}
