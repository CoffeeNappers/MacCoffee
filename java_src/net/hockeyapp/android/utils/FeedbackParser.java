package net.hockeyapp.android.utils;

import com.vkontakte.android.fragments.AuthCheckFragment;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import net.hockeyapp.android.objects.Feedback;
import net.hockeyapp.android.objects.FeedbackAttachment;
import net.hockeyapp.android.objects.FeedbackMessage;
import net.hockeyapp.android.objects.FeedbackResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class FeedbackParser {
    private FeedbackParser() {
    }

    /* loaded from: classes3.dex */
    private static class FeedbackParserHolder {
        public static final FeedbackParser INSTANCE = new FeedbackParser();

        private FeedbackParserHolder() {
        }
    }

    public static FeedbackParser getInstance() {
        return FeedbackParserHolder.INSTANCE;
    }

    public FeedbackResponse parseFeedbackResponse(String feedbackResponseJson) {
        JSONObject jsonObject;
        Feedback feedback;
        FeedbackResponse feedbackResponse;
        FeedbackResponse feedbackResponse2 = null;
        if (feedbackResponseJson == null) {
            return null;
        }
        try {
            jsonObject = new JSONObject(feedbackResponseJson);
            JSONObject feedbackObject = jsonObject.getJSONObject("feedback");
            feedback = new Feedback();
            try {
                JSONArray messagesArray = feedbackObject.getJSONArray("messages");
                ArrayList<FeedbackMessage> messages = null;
                if (messagesArray.length() > 0) {
                    messages = new ArrayList<>();
                    for (int i = 0; i < messagesArray.length(); i++) {
                        String subject = messagesArray.getJSONObject(i).getString("subject").toString();
                        String text = messagesArray.getJSONObject(i).getString("text").toString();
                        String oem = messagesArray.getJSONObject(i).getString("oem").toString();
                        String model = messagesArray.getJSONObject(i).getString("model").toString();
                        String osVersion = messagesArray.getJSONObject(i).getString("os_version").toString();
                        String createdAt = messagesArray.getJSONObject(i).getString("created_at").toString();
                        int id = messagesArray.getJSONObject(i).getInt("id");
                        String token = messagesArray.getJSONObject(i).getString(AuthCheckFragment.KEY_TOKEN).toString();
                        int via = messagesArray.getJSONObject(i).getInt("via");
                        String userString = messagesArray.getJSONObject(i).getString("user_string").toString();
                        String cleanText = messagesArray.getJSONObject(i).getString("clean_text").toString();
                        String name = messagesArray.getJSONObject(i).getString("name").toString();
                        String appId = messagesArray.getJSONObject(i).getString("app_id").toString();
                        JSONArray jsonAttachments = messagesArray.getJSONObject(i).optJSONArray("attachments");
                        List<FeedbackAttachment> feedbackAttachments = Collections.emptyList();
                        if (jsonAttachments != null) {
                            feedbackAttachments = new ArrayList<>();
                            for (int j = 0; j < jsonAttachments.length(); j++) {
                                int attachmentId = jsonAttachments.getJSONObject(j).getInt("id");
                                int attachmentMessageId = jsonAttachments.getJSONObject(j).getInt("feedback_message_id");
                                String filename = jsonAttachments.getJSONObject(j).getString("file_name");
                                String url = jsonAttachments.getJSONObject(j).getString("url");
                                String attachmentCreatedAt = jsonAttachments.getJSONObject(j).getString("created_at");
                                String attachmentUpdatedAt = jsonAttachments.getJSONObject(j).getString("updated_at");
                                FeedbackAttachment feedbackAttachment = new FeedbackAttachment();
                                feedbackAttachment.setId(attachmentId);
                                feedbackAttachment.setMessageId(attachmentMessageId);
                                feedbackAttachment.setFilename(filename);
                                feedbackAttachment.setUrl(url);
                                feedbackAttachment.setCreatedAt(attachmentCreatedAt);
                                feedbackAttachment.setUpdatedAt(attachmentUpdatedAt);
                                feedbackAttachments.add(feedbackAttachment);
                            }
                        }
                        FeedbackMessage feedbackMessage = new FeedbackMessage();
                        feedbackMessage.setAppId(appId);
                        feedbackMessage.setCleanText(cleanText);
                        feedbackMessage.setCreatedAt(createdAt);
                        feedbackMessage.setId(id);
                        feedbackMessage.setModel(model);
                        feedbackMessage.setName(name);
                        feedbackMessage.setOem(oem);
                        feedbackMessage.setOsVersion(osVersion);
                        feedbackMessage.setSubjec(subject);
                        feedbackMessage.setText(text);
                        feedbackMessage.setToken(token);
                        feedbackMessage.setUserString(userString);
                        feedbackMessage.setVia(via);
                        feedbackMessage.setFeedbackAttachments(feedbackAttachments);
                        messages.add(feedbackMessage);
                    }
                }
                feedback.setMessages(messages);
                try {
                    feedback.setName(feedbackObject.getString("name").toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                try {
                    feedback.setEmail(feedbackObject.getString("email").toString());
                } catch (JSONException e2) {
                    e2.printStackTrace();
                }
                try {
                    feedback.setId(feedbackObject.getInt("id"));
                } catch (JSONException e3) {
                    e3.printStackTrace();
                }
                try {
                    feedback.setCreatedAt(feedbackObject.getString("created_at").toString());
                } catch (JSONException e4) {
                    e4.printStackTrace();
                }
                feedbackResponse = new FeedbackResponse();
            } catch (JSONException e5) {
                e = e5;
                e.printStackTrace();
                return feedbackResponse2;
            }
        } catch (JSONException e6) {
            e = e6;
        }
        try {
            feedbackResponse.setFeedback(feedback);
            try {
                feedbackResponse.setStatus(jsonObject.getString("status").toString());
            } catch (JSONException e7) {
                e7.printStackTrace();
            }
            try {
                feedbackResponse.setToken(jsonObject.getString(AuthCheckFragment.KEY_TOKEN).toString());
            } catch (JSONException e8) {
                e8.printStackTrace();
            }
            return feedbackResponse;
        } catch (JSONException e9) {
            e = e9;
            feedbackResponse2 = feedbackResponse;
            e.printStackTrace();
            return feedbackResponse2;
        }
    }
}
