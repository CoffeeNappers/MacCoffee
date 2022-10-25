package com.vkontakte.android.api.polls;

import com.vkontakte.android.api.ResultlessAPIRequest;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PollsEdit extends ResultlessAPIRequest {
    public PollsEdit(int oid, int pid, String question, List<String> add, List<Integer> remove, Map<String, String> edit) {
        super("polls.edit");
        param("owner_id", oid);
        param("poll_id", pid);
        if (question != null) {
            param("question", question);
        }
        if (add != null && add.size() > 0) {
            param("add_answers", new JSONArray((Collection) add).toString());
        }
        if (remove != null && remove.size() > 0) {
            param("delete_answers", new JSONArray((Collection) remove).toString());
        }
        if (edit != null && edit.size() > 0) {
            param("edit_answers", new JSONObject(edit).toString());
        }
    }
}
