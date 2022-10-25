package com.vkontakte.android.api.board;

import android.content.Context;
import android.support.annotation.NonNull;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.board.BoardGetComments;
import com.vkontakte.android.attachments.PollAttachment;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes2.dex */
public class BoardCommentsLoader {
    private final int countOnPage;
    private final int groupId;
    private volatile boolean isDownLoading;
    private volatile boolean isUpLoaded;
    private volatile boolean isUpLoading;
    @NonNull
    private final BoardCommentsLoaderListener listener;
    private boolean loadEnd;
    private int offset;
    private int topicId;
    AtomicInteger session = new AtomicInteger(0);
    private int total = -1;
    private ArrayList<LinkedList<BoardComment>> cache = new ArrayList<>();
    private LinkedList<BoardComment> linkedList = new LinkedList<>();
    private volatile BoardGetComments upRequest = null;
    private volatile BoardGetComments downRequest = null;
    private volatile boolean isDownLoaded = false;

    /* loaded from: classes2.dex */
    public interface BoardCommentsLoaderListener {
        void onCommentLoaded(int i, int i2, boolean z, List<BoardComment> list);

        void onFinishLoading(int i, boolean z);

        void onItemDeleted(int i, List<BoardComment> list);

        void onStartLoading(int i, boolean z);

        void onStartReload();

        void scrollToPosition(int i, boolean z);

        void updatePool(PollAttachment pollAttachment);

        void updateTotal(int i);
    }

    public BoardCommentsLoader(int groupId, int topicId, int countOnPage, @NonNull BoardCommentsLoaderListener listener, boolean loadEnd) {
        this.groupId = groupId;
        this.topicId = topicId;
        this.countOnPage = countOnPage;
        this.listener = listener;
        this.loadEnd = loadEnd;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int countForLoad() {
        return this.countOnPage * 2;
    }

    private int getTopOffset() {
        if (this.linkedList.isEmpty()) {
            return 0;
        }
        return this.linkedList.getFirst().offset;
    }

    private int getBottomOffset() {
        if (this.linkedList.isEmpty()) {
            return 0;
        }
        return this.linkedList.getLast().offset;
    }

    private static boolean containOffset(LinkedList<BoardComment> linkedList, int offset) {
        return !linkedList.isEmpty() && offset >= linkedList.getFirst().offset && offset <= linkedList.getLast().offset;
    }

    private void setTotal(int total) {
        if (this.linkedList.size() > total) {
            total = this.linkedList.size();
        }
        this.total = total;
        this.listener.updateTotal(total);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int processComments(BoardGetComments.Result r, boolean isTop) {
        if (r.pId > 0) {
            this.listener.updatePool(new PollAttachment(r.pQuestion, r.pOwnerId, r.pId, r.pOptions, r.pVotes, r.pAnsId, r.pAnonymous != 0, r.pCreated, true));
        }
        int addedCount = isTop ? processTopComments(r.comments) : processBottomComments(r.comments);
        if (r.total < this.total) {
            this.cache.clear();
        }
        setTotal(r.total);
        return addedCount;
    }

    private int processTopComments(@NonNull List<BoardComment> comments) {
        int addedCount = comments.size();
        while (!this.linkedList.isEmpty() && comments.contains(this.linkedList.getFirst())) {
            this.linkedList.removeFirst();
            addedCount--;
        }
        this.linkedList.addAll(0, comments);
        this.isUpLoaded = addedCount == 0;
        this.listener.onCommentLoaded(0, addedCount, true, new ArrayList(this.linkedList));
        return addedCount;
    }

    private int processBottomComments(@NonNull List<BoardComment> comments) {
        int addedCount = comments.size();
        int startItem = this.linkedList.size();
        while (!this.linkedList.isEmpty() && comments.contains(this.linkedList.getLast())) {
            this.linkedList.removeLast();
            addedCount--;
        }
        this.linkedList.addAll(comments);
        this.isDownLoaded = addedCount == 0;
        this.listener.onCommentLoaded(startItem, addedCount, false, new ArrayList(this.linkedList));
        return addedCount;
    }

    public void init(int offset, Context ctx) {
        this.session.incrementAndGet();
        this.isDownLoading = false;
        this.isDownLoaded = false;
        this.isUpLoading = false;
        this.isUpLoaded = false;
        this.offset = offset;
        this.total = -1;
        setCurrentListToCache();
        this.linkedList = new LinkedList<>();
        this.listener.onStartReload();
        loadDown(ctx);
    }

    private static int removeCommentFromListCorrectly(LinkedList<BoardComment> list, BoardComment boardComment) {
        int index = -1;
        int i = 0;
        Iterator<BoardComment> it = list.iterator();
        while (it.hasNext()) {
            BoardComment comment = it.next();
            if (boardComment.equals(comment)) {
                it.remove();
                index = i;
            } else if (boardComment.offset < comment.offset) {
                comment.offset--;
            }
            i++;
        }
        return index;
    }

    private void setCurrentListToCache() {
        if (!this.linkedList.isEmpty()) {
            this.cache.add(this.linkedList);
        }
    }

    private LinkedList<BoardComment> getCacheFor(int offset) {
        Iterator<LinkedList<BoardComment>> it = this.cache.iterator();
        while (it.hasNext()) {
            LinkedList<BoardComment> comments = it.next();
            if (containOffset(comments, offset)) {
                return comments;
            }
        }
        return null;
    }

    public void cancel() {
        VKAPIRequest request = this.upRequest;
        if (request != null) {
            request.cancel();
        }
        VKAPIRequest request2 = this.downRequest;
        if (request2 != null) {
            request2.cancel();
        }
    }

    public void removeComment(BoardComment boardComment) {
        int index = removeCommentFromListCorrectly(this.linkedList, boardComment);
        Iterator<LinkedList<BoardComment>> it = this.cache.iterator();
        while (it.hasNext()) {
            LinkedList<BoardComment> list = it.next();
            removeCommentFromListCorrectly(list, boardComment);
        }
        BoardCommentsLoaderListener boardCommentsLoaderListener = this.listener;
        int i = this.total - 1;
        this.total = i;
        boardCommentsLoaderListener.updateTotal(i);
        this.listener.onItemDeleted(index, new ArrayList(this.linkedList));
    }

    public BoardCommentsLoader show(int offset, Context ctx) {
        this.session.incrementAndGet();
        this.listener.onFinishLoading(this.linkedList.size(), true);
        this.listener.onFinishLoading(this.linkedList.size(), false);
        if (containOffset(this.linkedList, offset)) {
            int i = 0;
            Iterator<BoardComment> it = this.linkedList.iterator();
            while (it.hasNext()) {
                BoardComment comment = it.next();
                if (comment.offset == offset) {
                    this.listener.scrollToPosition(i, false);
                }
                i++;
            }
            if (offset - this.countOnPage <= getTopOffset()) {
                loadTop(ctx);
            }
            if (this.countOnPage + offset >= getBottomOffset()) {
                loadDown(ctx);
            }
        } else {
            LinkedList<BoardComment> cacheList = getCacheFor(offset);
            if (cacheList != null) {
                this.isDownLoading = false;
                this.isDownLoaded = false;
                this.isUpLoading = false;
                this.isUpLoaded = false;
                this.offset = offset;
                this.total = -1;
                setCurrentListToCache();
                this.linkedList = cacheList;
                this.listener.onStartReload();
                this.listener.onCommentLoaded(this.linkedList.getFirst().offset, this.linkedList.size(), false, new ArrayList(this.linkedList));
                int i2 = 0;
                Iterator<BoardComment> it2 = this.linkedList.iterator();
                while (it2.hasNext()) {
                    BoardComment comment2 = it2.next();
                    if (comment2.offset == offset) {
                        this.listener.scrollToPosition(i2, false);
                    }
                    i2++;
                }
            } else {
                init(offset, ctx);
            }
        }
        return this;
    }

    public synchronized void loadTop(Context ctx) {
        if (!this.isUpLoading && !this.isUpLoaded && this.total > 0 && this.offset > 0) {
            final int session = this.session.get();
            this.isUpLoading = true;
            this.listener.onStartLoading(this.linkedList.size(), true);
            if (this.upRequest != null) {
                this.upRequest.cancel();
            }
            this.upRequest = new BoardGetComments(this.groupId, this.topicId, countForLoad(), BoardGetComments.PagingKey.offset, Math.max(this.offset - this.countOnPage, 0));
            this.upRequest.setCallback(new Callback<BoardGetComments.Result>() { // from class: com.vkontakte.android.api.board.BoardCommentsLoader.1
                @Override // com.vkontakte.android.api.Callback
                public void success(BoardGetComments.Result result) {
                    if (session == BoardCommentsLoader.this.session.get()) {
                        int countAdded = BoardCommentsLoader.this.processComments(result, true);
                        if (result.comments.size() < 0) {
                            BoardCommentsLoader.this.isUpLoaded = true;
                        }
                        BoardCommentsLoader.this.offset -= countAdded;
                        BoardCommentsLoader.this.isUpLoading = false;
                        BoardCommentsLoader.this.listener.onStartLoading(BoardCommentsLoader.this.linkedList.size(), true);
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    if (session == BoardCommentsLoader.this.session.get()) {
                        BoardCommentsLoader.this.isUpLoading = false;
                        BoardCommentsLoader.this.listener.onStartLoading(BoardCommentsLoader.this.linkedList.size(), true);
                    }
                }
            }).exec(ctx);
        }
    }

    public synchronized void loadDown(final Context ctx) {
        if (!this.isDownLoading && !this.isDownLoaded) {
            this.isDownLoading = true;
            final int session = this.session.get();
            this.listener.onStartLoading(this.linkedList.size(), false);
            if (this.downRequest != null) {
                this.downRequest.cancel();
            }
            if (this.loadEnd) {
                this.downRequest = new BoardGetComments(this.groupId, this.topicId, countForLoad(), BoardGetComments.PagingKey.offset, this.offset);
            } else if (this.linkedList.isEmpty()) {
                this.downRequest = new BoardGetComments(this.groupId, this.topicId, countForLoad(), BoardGetComments.PagingKey.offset, this.offset);
            } else {
                this.downRequest = new BoardGetComments(this.groupId, this.topicId, countForLoad(), BoardGetComments.PagingKey.startCommentId, this.linkedList.getLast().id);
            }
            this.downRequest.setCallback(new Callback<BoardGetComments.Result>() { // from class: com.vkontakte.android.api.board.BoardCommentsLoader.2
                @Override // com.vkontakte.android.api.Callback
                public void success(BoardGetComments.Result result) {
                    if (session == BoardCommentsLoader.this.session.get()) {
                        int size = BoardCommentsLoader.this.linkedList.size();
                        BoardCommentsLoader.this.processComments(result, false);
                        if (result.comments.size() < BoardCommentsLoader.this.countForLoad()) {
                            BoardCommentsLoader.this.isDownLoaded = true;
                            if (size == 0) {
                                BoardCommentsLoader.this.loadTop(ctx);
                            }
                        }
                        BoardCommentsLoader.this.isDownLoading = false;
                        BoardCommentsLoader.this.listener.onFinishLoading(BoardCommentsLoader.this.linkedList.size(), false);
                        if (BoardCommentsLoader.this.loadEnd) {
                            BoardCommentsLoader.this.loadEnd = false;
                            BoardCommentsLoader.this.listener.scrollToPosition(BoardCommentsLoader.this.linkedList.size() - 1, false);
                        }
                    }
                }

                @Override // com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    if (session == BoardCommentsLoader.this.session.get()) {
                        BoardCommentsLoader.this.isDownLoading = false;
                        BoardCommentsLoader.this.listener.onFinishLoading(BoardCommentsLoader.this.linkedList.size(), false);
                    }
                }
            }).exec(ctx);
        }
    }

    public boolean isEndOfListLoaded() {
        return !this.linkedList.isEmpty() && this.linkedList.getLast().offset == this.total + (-1);
    }

    public void insertComment(BoardComment boardComment) {
        if (isEndOfListLoaded()) {
            boardComment.offset = this.total;
            this.linkedList.add(boardComment);
            this.total++;
            this.listener.updateTotal(this.total);
            this.listener.onCommentLoaded(this.total - 1, 1, false, new ArrayList(this.linkedList));
            this.listener.scrollToPosition(this.total - 1, true);
        }
    }

    public boolean isDownLoaded() {
        return this.isDownLoaded;
    }

    public int getTotal() {
        return this.total;
    }
}
