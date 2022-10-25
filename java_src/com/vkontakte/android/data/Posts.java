package com.vkontakte.android.data;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.wall.WallDelete;
import com.vkontakte.android.api.wall.WallEdit;
import com.vkontakte.android.api.wall.WallLike;
import com.vkontakte.android.api.wall.WallPost;
import com.vkontakte.android.api.wall.WallSetFixed;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.attachments.AudioPlaylistAttachment;
import com.vkontakte.android.attachments.BoardTopicAttachment;
import com.vkontakte.android.attachments.DocumentAttachment;
import com.vkontakte.android.attachments.FriendsRecommAttachment;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.attachments.LinkAttachment;
import com.vkontakte.android.attachments.MarketAlbumAttachment;
import com.vkontakte.android.attachments.MarketAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.attachments.PrettyCardAttachment;
import com.vkontakte.android.attachments.RepostAttachment;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.attachments.SignatureLinkAttachment;
import com.vkontakte.android.attachments.SnippetAttachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.attachments.ThumbAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.attachments.WidgetAttachment;
import com.vkontakte.android.attachments.WikiAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.cache.NewsfeedCache;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.ui.posts.ActivityCommentDisplayItem;
import com.vkontakte.android.ui.posts.ActivityLikesDisplayItem;
import com.vkontakte.android.ui.posts.AttachContainerPostDisplayItem;
import com.vkontakte.android.ui.posts.AudioPostDisplayItem;
import com.vkontakte.android.ui.posts.ButtonsPostDisplayItem;
import com.vkontakte.android.ui.posts.CommentPostDisplayItem;
import com.vkontakte.android.ui.posts.CommonAttachmentPostDisplayItem;
import com.vkontakte.android.ui.posts.FooterPostDisplayItem;
import com.vkontakte.android.ui.posts.FriendsRecommPostDisplayItem;
import com.vkontakte.android.ui.posts.GoodsBlockPostDisplayItem;
import com.vkontakte.android.ui.posts.HeaderPostDisplayItem;
import com.vkontakte.android.ui.posts.MarkedAsAdsPostDisplayItem;
import com.vkontakte.android.ui.posts.NotificationPostDisplayItemGallery;
import com.vkontakte.android.ui.posts.PaddingPostDisplayItem;
import com.vkontakte.android.ui.posts.PostDisplayItem;
import com.vkontakte.android.ui.posts.RepostPostDisplayItem;
import com.vkontakte.android.ui.posts.ShitBlockPostDisplayItem;
import com.vkontakte.android.ui.posts.SignaturePostDisplayItem;
import com.vkontakte.android.ui.posts.TextPostDisplayItem;
import com.vkontakte.android.ui.posts.ThumbsBlockPostDisplayItem;
import com.vkontakte.android.ui.posts.WidgetPostDisplayItem;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class Posts {
    public static final String ACTION_NEW_POST_BROADCAST = "com.vkontakte.android.NEW_POST_ADDED";
    public static final String ACTION_POST_DELETED_BROADCAST = "com.vkontakte.android.POST_DELETED";
    public static final String ACTION_POST_REPLACED_BROADCAST = "com.vkontakte.android.POST_REPLACED";
    public static final String ACTION_POST_UPDATED_BROADCAST = "com.vkontakte.android.POST_UPDATED";
    public static final String ACTION_RELOAD_FEED = "com.vkontakte.android.RELOAD_FEED";
    public static final String ACTION_RELOAD_PROFILE = "com.vkontakte.android.RELOAD_PROFILE";
    public static final String ACTION_SUGGESTED_POST_PUBLISHED_BROADCAST = "com.vkontakte.android.POST_DELETED";
    public static final String ACTION_USER_NAME_CHANGED = "com.vkontakte.android.USER_NAME_CHANGED";
    public static final String ACTION_USER_PHOTO_CHANGED = "com.vkontakte.android.USER_PHOTO_CHANGED";
    public static boolean feedClearForNew;
    public static String feedFrom;
    public static int feedItem;
    public static int feedItemOffset;
    public static int feedOffset;
    public static String newNewsFrom;
    public static List<NewsEntry> feed = new ArrayList();
    public static List<NewsEntry> preloadedFeed = new ArrayList();
    public static List<NewsEntry> newNews = new ArrayList();
    private static ArrayList<Long> liking = new ArrayList<>();

    public static void deleteFromStaticCache(int oid, int pid) {
        feed = copyWithout(feed, oid, pid);
        preloadedFeed = copyWithout(preloadedFeed, oid, pid);
        newNews = copyWithout(newNews, oid, pid);
    }

    public static void clear() {
        feed.clear();
        preloadedFeed.clear();
        newNews.clear();
    }

    @NonNull
    private static List<NewsEntry> copyWithout(@NonNull List<NewsEntry> list, int oid, int pid) {
        List<NewsEntry> buf = new ArrayList<>(list.size());
        for (int i = 0; i < list.size(); i++) {
            NewsEntry entry = list.get(i);
            if (entry.ownerID != oid || entry.postID != oid) {
                buf.add(entry);
            }
        }
        return buf;
    }

    public static void publishPostponed(final NewsEntry e, final Activity context, final Runnable runAfter) {
        new WallPost(e.ownerID, e.postID).setCallback(new SimpleCallback<Integer>(context) { // from class: com.vkontakte.android.data.Posts.1
            @Override // com.vkontakte.android.api.Callback
            public void success(Integer id) {
                Intent intent = new Intent("com.vkontakte.android.POST_DELETED");
                intent.putExtra("owner_id", e.ownerID);
                intent.putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, e.postID);
                intent.putExtra(ArgKeys.POST, e);
                context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                NewsEntry n = new NewsEntry(e);
                n.flag(2048, false);
                n.flags |= 2;
                n.postID = id.intValue();
                n.time = TimeUtils.getCurrentTime();
                Intent intent2 = new Intent(Posts.ACTION_NEW_POST_BROADCAST);
                intent2.putExtra("entry", n);
                context.sendBroadcast(intent2, "com.vkontakte.android.permission.ACCESS_DATA");
                Toast.makeText(context, (int) R.string.wall_ok, 0).show();
                if (runAfter != null) {
                    runAfter.run();
                }
            }
        }).wrapProgress(context).exec((Context) context);
    }

    public static List<PostDisplayItem> buildAttachItems(List<Attachment> attachments, NewsEntry e, String referer, boolean fromList, int listPos, PostInteract postInteract) {
        int postID = e.postID;
        int ownerID = e.ownerID;
        ArrayList<PostDisplayItem> result = new ArrayList<>();
        ArrayList<ThumbAttachment> tAtts = new ArrayList<>();
        ArrayList<AudioAttachment> audios = new ArrayList<>();
        ArrayList<Attachment> markets = new ArrayList<>();
        ArrayList<Attachment> marketAlbums = new ArrayList<>();
        ArrayList<Attachment> audioPlaylists = null;
        ArrayList<Attachment> other = new ArrayList<>();
        ArrayList<Attachment> other2 = new ArrayList<>();
        ArrayList<Attachment> common = new ArrayList<>();
        ArrayList<Attachment> sig = new ArrayList<>();
        RepostAttachment repost = null;
        int docCount = 0;
        DocumentAttachment lastDocument = null;
        int videoCount = 0;
        VideoAttachment lastVideo = null;
        for (Attachment att : attachments) {
            if (att != null) {
                if (att instanceof VideoAttachment) {
                    lastVideo = (VideoAttachment) att;
                    videoCount++;
                } else if ((att instanceof ShitAttachment) && ((ShitAttachment) att).video != null) {
                    lastVideo = ((ShitAttachment) att).video;
                    videoCount++;
                }
                if (att instanceof MarketAlbumAttachment) {
                    marketAlbums.add(att);
                } else if (att instanceof ThumbAttachment) {
                    tAtts.add((ThumbAttachment) att);
                } else if (att instanceof AudioAttachment) {
                    audios.add((AudioAttachment) att);
                } else if (att instanceof SignatureLinkAttachment) {
                    sig.add(att);
                } else if ((att instanceof GeoAttachment) && ((GeoAttachment) att).style == 1) {
                    sig.add(att);
                } else if (att instanceof RepostAttachment) {
                    repost = (RepostAttachment) att;
                } else if (att instanceof PollAttachment) {
                    other2.add(att);
                } else if (att instanceof MarketAttachment) {
                    markets.add(att);
                } else if ((att instanceof StickerAttachment) || (att instanceof GraffitiAttachment)) {
                    other.add(att);
                } else if (att instanceof SnippetAttachment) {
                    ((SnippetAttachment) att).setReferData(postInteract);
                    other2.add(att);
                } else if (((att instanceof GeoAttachment) && ((GeoAttachment) att).style == 3) || (att instanceof PollAttachment)) {
                    other2.add(att);
                } else if (!(att instanceof ShitAttachment) || (e.type == 11 && fromList)) {
                    if ((att instanceof ShitAttachment) && e.type == 11) {
                        if (result.size() == 0) {
                            result.add(((ShitAttachment) att).cards.isEmpty() ? new ShitBlockPostDisplayItem(e, referer, postInteract) : new GoodsBlockPostDisplayItem(e));
                        }
                    } else if (((att instanceof DocumentAttachment) && !TextUtils.isEmpty(((ImageAttachment) att).getImageURL())) || (((att instanceof GeoAttachment) && ((GeoAttachment) att).id <= 0) || (att instanceof ShitAttachment))) {
                        other.add(att);
                        if (att instanceof DocumentAttachment) {
                            docCount++;
                            lastDocument = (DocumentAttachment) att;
                        }
                    } else if (att instanceof FriendsRecommAttachment) {
                        result.add(new FriendsRecommPostDisplayItem((FriendsRecommAttachment) att, e, listPos));
                    } else if (att instanceof AudioPlaylistAttachment) {
                        if (audioPlaylists == null) {
                            audioPlaylists = new ArrayList<>();
                        }
                        audioPlaylists.add(att);
                    } else if (att instanceof WidgetAttachment) {
                        result.add(new WidgetPostDisplayItem(e));
                    } else if (att instanceof PrettyCardAttachment) {
                        int adsId1 = e.extra.getInt(NewsEntry.EXTRAS_KEY_ADS_ID_1, 0);
                        int adsId2 = e.extra.getInt(NewsEntry.EXTRAS_KEY_ADS_ID_2, 0);
                        ((PrettyCardAttachment) att).setStatisticsData(postInteract, adsId1, adsId2);
                        other2.add(att);
                    } else {
                        common.add(att);
                    }
                }
                if (att instanceof LinkAttachment) {
                    ((LinkAttachment) att).referWiki = "post?" + ownerID + '_' + postID;
                } else if (att instanceof SnippetAttachment) {
                    ((SnippetAttachment) att).referWiki = "post?" + ownerID + '_' + postID;
                } else if (att instanceof WikiAttachment) {
                    ((WikiAttachment) att).refer = "post?" + ownerID + '_' + postID;
                }
            }
        }
        if (videoCount == 1 && lastVideo != null && tAtts.size() <= 1) {
            lastVideo.setSingle(true);
        }
        if (tAtts.size() > 0) {
            if (fromList || tAtts.size() > 3) {
                result.add(new ThumbsBlockPostDisplayItem(e, tAtts, false, referer, null, postInteract));
            } else {
                Iterator<ThumbAttachment> it = tAtts.iterator();
                while (it.hasNext()) {
                    ThumbAttachment ta = it.next();
                    ThumbsBlockPostDisplayItem item = new ThumbsBlockPostDisplayItem(e, Collections.singletonList(ta), false, referer, tAtts, postInteract);
                    result.add(item);
                    if (ta instanceof PhotoAttachment) {
                        PhotoAttachment pa = (PhotoAttachment) ta;
                        if (!TextUtils.isEmpty(pa.descr) && (e.type != 1 || TextUtils.isEmpty(e.text))) {
                            result.add(new TextPostDisplayItem(e.postID, e.ownerID, Global.replaceEmoji(LinkParser.parseLinks(pa.descr, 7, postInteract)), null, false, true, postInteract));
                        }
                    }
                }
            }
        }
        if (marketAlbums.size() > 0) {
            result.add(new AttachContainerPostDisplayItem(e, marketAlbums, fromList, true));
        }
        if (markets.size() > 0) {
            result.add(new AttachContainerPostDisplayItem(e, markets, fromList, true));
        }
        if (audioPlaylists != null && audioPlaylists.size() > 0) {
            result.add(new AttachContainerPostDisplayItem(e, audioPlaylists, fromList, true));
        }
        if (audios.size() > 0) {
            ArrayList<MusicTrack> pl = new ArrayList<>();
            for (int i = 0; i < audios.size(); i++) {
                pl.add(audios.get(i).musicTrack);
            }
            int i2 = 0;
            Iterator<AudioAttachment> it2 = audios.iterator();
            while (it2.hasNext()) {
                AudioAttachment aa = it2.next();
                aa.playlist = pl;
                aa.playlistPos = i2;
                aa.setReferData(referer, postInteract);
                result.add(new AudioPostDisplayItem(e, aa));
                i2++;
            }
        }
        if (other.size() > 0) {
            if (lastDocument != null && docCount == 1) {
                lastDocument.isSingle = true;
                result.add(new AttachContainerPostDisplayItem(e, other, fromList, TextUtils.isEmpty(lastDocument.video)));
            } else {
                result.add(new AttachContainerPostDisplayItem(e, other, fromList, true));
            }
        }
        if (other2.size() > 0) {
            result.add(new AttachContainerPostDisplayItem(e, other2, fromList, false));
        }
        if (common.size() > 0) {
            Iterator<Attachment> it3 = common.iterator();
            while (it3.hasNext()) {
                Attachment aa2 = it3.next();
                if (aa2 instanceof LinkAttachment) {
                    ((LinkAttachment) aa2).setReferrer(e, postInteract);
                }
                result.add(new CommonAttachmentPostDisplayItem(e, aa2));
            }
        }
        if (sig.size() > 0) {
            Iterator<Attachment> it4 = sig.iterator();
            while (it4.hasNext()) {
                result.add(new SignaturePostDisplayItem(e, it4.next()));
            }
        }
        if (repost != null) {
            result.add(new RepostPostDisplayItem(e, repost.name, repost.photo, repost.ownerID, repost.time, repost.postID, repost.type, null));
        }
        return result;
    }

    public static List<PostDisplayItem> buildItems(NewsEntry e, boolean photosMode, String referer, boolean feedbackStyle, boolean canHideFromFeed, View.OnClickListener menuClickListener, boolean fromList, String listReferrer, int listPos) {
        Parcelable parcelable;
        PostInteract postInteract = new PostInteract(listReferrer, e);
        ArrayList<PostDisplayItem> result = new ArrayList<>();
        if (e.type == 15 && (parcelable = e.extra.getParcelable(NewsEntry.EXTRAS_KEY_USER_NOTIFICATION)) != null) {
            result.add(new NotificationPostDisplayItemGallery((UserNotification) parcelable));
        }
        if (e.type != 13 && e.type != 11 && e.type != 15 && e.type != 19) {
            HeaderPostDisplayItem hdr = new HeaderPostDisplayItem(e, photosMode, fromList, listReferrer, listPos, postInteract);
            hdr.menuClickListener = menuClickListener;
            hdr.showMenu = menuClickListener != null && (!(e.type == 6 || e.type == 7 || e.type == 9) || (canHideFromFeed && e.ownerID != VKAccountManager.getCurrent().getUid()));
            result.add(hdr);
        }
        if (!fromList && e.type == 2) {
            result.addAll(buildAttachItems(e.attachments, e, referer, fromList, listPos, postInteract));
        }
        if (e.flag(32)) {
            if (e.retweetText != null && e.retweetText.length() > 0) {
                result.add(new TextPostDisplayItem(e.postID, e.ownerID, fromList ? e.displayableRetweetText : Global.replaceEmoji(LinkParser.parseLinks(e.retweetText, 7, postInteract)), e.retweetText, false, !fromList, postInteract));
            }
            if (e.repostAttachments.size() > 0) {
                result.addAll(buildAttachItems(e.repostAttachments, e, referer, fromList, listPos, postInteract));
            }
            result.add(new RepostPostDisplayItem(e, e.retweetUserName, e.retweetUserPhoto, e.retweetUID, e.retweetOrigTime, e.retweetOrigId, e.retweetType, e));
        }
        if (e.flag(32768) && !"kz".equals(Global.getDeviceLang())) {
            if (e.text.length() > 0) {
                result.add(new TextPostDisplayItem(e.postID, e.ownerID, VKApplication.context.getResources().getString(e.f ? R.string.page_deleted_f : R.string.page_deleted_m), null, true, false, postInteract));
            } else {
                result.add(new TextPostDisplayItem(e.postID, e.ownerID, VKApplication.context.getResources().getString(e.f ? R.string.page_deleted_silent_f : R.string.page_deleted_silent_m), null, true, false, postInteract));
            }
        }
        if (e.text.length() > 0 && !photosMode && e.type != 4) {
            result.add(new TextPostDisplayItem(e.postID, e.ownerID, fromList ? e.displayablePreviewText : Global.replaceEmoji(LinkParser.parseLinks(e.text, 7, postInteract)), e.text, e.flag(16), !fromList, postInteract));
        }
        if (e.flag(32768) && "kz".equals(Global.getDeviceLang())) {
            if (e.text.length() > 0) {
                result.add(new TextPostDisplayItem(e.postID, e.ownerID, VKApplication.context.getResources().getString(e.f ? R.string.page_deleted_f : R.string.page_deleted_m), null, true, false, postInteract));
            } else {
                result.add(new TextPostDisplayItem(e.postID, e.ownerID, VKApplication.context.getResources().getString(e.f ? R.string.page_deleted_silent_f : R.string.page_deleted_silent_m), null, true, false, postInteract));
            }
        }
        if (fromList || e.type != 2) {
            result.addAll(buildAttachItems(e.attachments, e, referer, fromList, listPos, postInteract));
        }
        if (e.type == 4) {
            result.add(new CommonAttachmentPostDisplayItem(e, new BoardTopicAttachment(e.text)));
        }
        if (e.extra.getBoolean(NewsEntry.EXTRAS_KEY_MARKED_AS_ADS, false)) {
            result.add(new MarkedAsAdsPostDisplayItem(e));
        }
        if (fromList && e.type != 13 && e.type != 15 && !feedbackStyle) {
            if ((e.type != 2 || (e.attachments != null && e.attachments.size() == 1)) && e.type != 5 && e.type != 4 && e.type != 11 && e.type != 18 && e.type != 6 && e.type != 7 && e.type != 9 && e.type != 19 && !e.flag(4096) && !e.flag(2048)) {
                result.add(new FooterPostDisplayItem(e, feedbackStyle, e.type != 4, listReferrer));
                if (e.activity != null) {
                    if (e.activity.type == 0) {
                        result.add(new ActivityLikesDisplayItem(e));
                    } else if (e.activity.type == 1) {
                        result.add(new ActivityCommentDisplayItem(e, listReferrer));
                    }
                }
            }
            if (e.flag(4096) && Groups.getAdminLevel(-e.ownerID) >= 2) {
                result.add(new ButtonsPostDisplayItem(e));
            }
            if (e.lastComment != null) {
                result.add(new CommentPostDisplayItem(e, e.lastComment, e.lastCommentUserName, e.lastCommentUserPhoto, e.numComments, e.lastCommentTime, e.lastCommentUserID));
            }
            if (e.type == 5) {
                result.add(new PaddingPostDisplayItem(e, V.dp(16.0f)));
            }
        }
        if (result.size() == 1) {
            result.get(0).bgType = 3;
        } else if (result.size() > 0) {
            result.get(0).bgType = 1;
            result.get(result.size() - 1).bgType = 2;
        }
        if ((e.type == 2 && e.attachments != null && e.attachments.size() > 1) || e.type == 7 || e.type == 15 || e.type == 6 || e.type == 9 || e.type == 13) {
            Iterator<PostDisplayItem> it = result.iterator();
            while (it.hasNext()) {
                PostDisplayItem di = it.next();
                di.clickable = false;
            }
        }
        if (result.size() > 0) {
            result.get(result.size() - 1).setOnBindView(Analytics.getOnBindViewForNewsEntry(e));
        }
        return result;
    }

    public static void editRepostComment(NewsEntry e, String text, Activity act) {
        EditText edit = new EditText(act);
        edit.setText(text);
        edit.setLines(4);
        edit.setGravity(48);
        edit.setSelection(edit.getText().length());
        edit.setBackgroundColor(0);
        new VKAlertDialog.Builder(act).setTitle(R.string.add_comment_hint).setView(edit).setPositiveButton(R.string.save, Posts$$Lambda$1.lambdaFactory$(e, edit, act)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
    }

    public static void saveRepostComment(final NewsEntry e, final String newComment, final Activity act) {
        new WallEdit(e.postID, e.ownerID, newComment).setCallback(new ResultlessCallback(act) { // from class: com.vkontakte.android.data.Posts.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Toast.makeText(act, (int) R.string.post_edit_saved, 0).show();
                e.retweetText = newComment;
                if (e.ownerID == e.userID) {
                    NewsfeedCache.replaceOne(e, false);
                }
                Intent intent = new Intent(Posts.ACTION_POST_REPLACED_BROADCAST);
                intent.putExtra("entry", e);
                act.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse err) {
                super.fail(err);
                Posts.editRepostComment(e, newComment, act);
            }
        }).wrapProgress(act).exec((Context) act);
    }

    public static void deletePost(final NewsEntry e, final Context act) {
        try {
            new WallDelete(e.ownerID, e.postID, e.type).setCallback(new ResultlessCallback(act) { // from class: com.vkontakte.android.data.Posts.3
                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    NewsfeedCache.remove(e.ownerID, e.postID);
                    Intent intent = new Intent("com.vkontakte.android.POST_DELETED");
                    intent.putExtra("owner_id", e.ownerID);
                    intent.putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, e.postID);
                    intent.putExtra(ArgKeys.POST, e);
                    act.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                }
            }).wrapProgress(act).exec(act);
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    public static void like(NewsEntry e, boolean liked, Activity act, String referer) {
        if (VKAuth.ensureLoggedIn(act)) {
            e.flag(8, liked);
            long id = (e.type << 60) | (e.ownerID << 32) | e.postID;
            if (liked) {
                e.numLikes++;
            } else {
                e.numLikes--;
            }
            broadcastPostUpdate(e);
            if (!liking.contains(Long.valueOf(id))) {
                liking.add(Long.valueOf(id));
                int lOid = e.ownerID;
                int lPid = e.postID;
                WallLike.newsEntry(e, liked, "").param("ref", referer).setCallback(new AnonymousClass4(id, e, liked, act, referer, lOid, lPid)).exec();
            }
        }
    }

    /* renamed from: com.vkontakte.android.data.Posts$4 */
    /* loaded from: classes2.dex */
    public static class AnonymousClass4 implements Callback<WallLike.Result> {
        final /* synthetic */ Activity val$act;
        final /* synthetic */ NewsEntry val$e;
        final /* synthetic */ long val$id;
        final /* synthetic */ int val$lOid;
        final /* synthetic */ int val$lPid;
        final /* synthetic */ boolean val$liked;
        final /* synthetic */ String val$referer;

        AnonymousClass4(long j, NewsEntry newsEntry, boolean z, Activity activity, String str, int i, int i2) {
            this.val$id = j;
            this.val$e = newsEntry;
            this.val$liked = z;
            this.val$act = activity;
            this.val$referer = str;
            this.val$lOid = i;
            this.val$lPid = i2;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(WallLike.Result res) {
            Posts.liking.remove(Long.valueOf(this.val$id));
            this.val$e.numLikes = res.likes;
            if (this.val$liked) {
                this.val$e.numRetweets = res.retweets;
            }
            if (this.val$e.flag(8) == this.val$liked) {
                Posts.broadcastPostUpdate(this.val$e);
                if (this.val$liked) {
                    Analytics.sendPromoPostActionByType(this.val$e, Statistic.TYPE_POST_LIKE);
                    return;
                }
                return;
            }
            Posts.like(this.val$e, this.val$e.flag(8), this.val$act, this.val$referer);
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse err) {
            if (this.val$e != null && this.val$lOid == this.val$e.ownerID && this.val$lPid == this.val$e.postID) {
                if (this.val$liked) {
                    NewsEntry newsEntry = this.val$e;
                    newsEntry.numLikes--;
                } else {
                    this.val$e.numLikes++;
                }
                this.val$e.flag(8, !this.val$liked);
                Posts.liking.remove(Long.valueOf(this.val$id));
                this.val$act.runOnUiThread(Posts$4$$Lambda$1.lambdaFactory$(this.val$act));
                Posts.broadcastPostUpdate(this.val$e);
            }
        }
    }

    public static void broadcastPostUpdate(NewsEntry post) {
        Intent intent = new Intent(ACTION_POST_UPDATED_BROADCAST).putExtra(ShareConstants.WEB_DIALOG_RESULT_PARAM_POST_ID, post.postID).putExtra("owner_id", post.ownerID).putExtra("post_type", post.type).putExtra("comments", post.numComments).putExtra("retweets", post.numRetweets).putExtra(ServerKeys.LIKES, post.numLikes).putExtra("liked", post.flag(8)).putExtra("retweeted", post.flag(4));
        VKApplication.context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
        if (post.type == 0) {
            NewsfeedCache.update(post.ownerID, post.postID, post.numLikes, post.numComments, post.numRetweets, post.flag(8), post.flag(4));
        }
    }

    public static void toggleFixed(final NewsEntry post, final Activity act, final Runnable runAfter) {
        new WallSetFixed(post.postID, post.ownerID, !post.flag(1024)).setCallback(new ResultlessCallback(act) { // from class: com.vkontakte.android.data.Posts.5
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                Intent intent = new Intent();
                intent.setAction(Posts.ACTION_RELOAD_PROFILE);
                intent.putExtra("id", post.ownerID);
                act.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
                if (runAfter != null) {
                    runAfter.run();
                }
            }
        }).wrapProgress(act).exec((Context) act);
    }
}
