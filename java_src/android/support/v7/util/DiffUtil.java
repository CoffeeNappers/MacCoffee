package android.support.v7.util;

import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v7.widget.RecyclerView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* loaded from: classes.dex */
public class DiffUtil {
    private static final Comparator<Snake> SNAKE_COMPARATOR = new Comparator<Snake>() { // from class: android.support.v7.util.DiffUtil.1
        @Override // java.util.Comparator
        public int compare(Snake o1, Snake o2) {
            int cmpX = o1.x - o2.x;
            return cmpX == 0 ? o1.y - o2.y : cmpX;
        }
    };

    private DiffUtil() {
    }

    public static DiffResult calculateDiff(Callback cb) {
        return calculateDiff(cb, true);
    }

    public static DiffResult calculateDiff(Callback cb, boolean detectMoves) {
        int oldSize = cb.getOldListSize();
        int newSize = cb.getNewListSize();
        List<Snake> snakes = new ArrayList<>();
        List<Range> stack = new ArrayList<>();
        stack.add(new Range(0, oldSize, 0, newSize));
        int max = oldSize + newSize + Math.abs(oldSize - newSize);
        int[] forward = new int[max * 2];
        int[] backward = new int[max * 2];
        List<Range> rangePool = new ArrayList<>();
        while (!stack.isEmpty()) {
            Range range = stack.remove(stack.size() - 1);
            Snake snake = diffPartial(cb, range.oldListStart, range.oldListEnd, range.newListStart, range.newListEnd, forward, backward, max);
            if (snake != null) {
                if (snake.size > 0) {
                    snakes.add(snake);
                }
                snake.x += range.oldListStart;
                snake.y += range.newListStart;
                Range left = rangePool.isEmpty() ? new Range() : rangePool.remove(rangePool.size() - 1);
                left.oldListStart = range.oldListStart;
                left.newListStart = range.newListStart;
                if (snake.reverse) {
                    left.oldListEnd = snake.x;
                    left.newListEnd = snake.y;
                } else if (snake.removal) {
                    left.oldListEnd = snake.x - 1;
                    left.newListEnd = snake.y;
                } else {
                    left.oldListEnd = snake.x;
                    left.newListEnd = snake.y - 1;
                }
                stack.add(left);
                if (!snake.reverse) {
                    range.oldListStart = snake.x + snake.size;
                    range.newListStart = snake.y + snake.size;
                } else if (snake.removal) {
                    range.oldListStart = snake.x + snake.size + 1;
                    range.newListStart = snake.y + snake.size;
                } else {
                    range.oldListStart = snake.x + snake.size;
                    range.newListStart = snake.y + snake.size + 1;
                }
                stack.add(range);
            } else {
                rangePool.add(range);
            }
        }
        Collections.sort(snakes, SNAKE_COMPARATOR);
        return new DiffResult(cb, snakes, forward, backward, detectMoves);
    }

    private static Snake diffPartial(Callback cb, int startOld, int endOld, int startNew, int endNew, int[] forward, int[] backward, int kOffset) {
        int x;
        boolean removal;
        int x2;
        boolean removal2;
        int oldSize = endOld - startOld;
        int newSize = endNew - startNew;
        if (endOld - startOld < 1 || endNew - startNew < 1) {
            return null;
        }
        int delta = oldSize - newSize;
        int dLimit = ((oldSize + newSize) + 1) / 2;
        Arrays.fill(forward, (kOffset - dLimit) - 1, kOffset + dLimit + 1, 0);
        Arrays.fill(backward, ((kOffset - dLimit) - 1) + delta, kOffset + dLimit + 1 + delta, oldSize);
        boolean checkInFwd = delta % 2 != 0;
        for (int d = 0; d <= dLimit; d++) {
            for (int k = -d; k <= d; k += 2) {
                if (k == (-d) || (k != d && forward[(kOffset + k) - 1] < forward[kOffset + k + 1])) {
                    x2 = forward[kOffset + k + 1];
                    removal2 = false;
                } else {
                    x2 = forward[(kOffset + k) - 1] + 1;
                    removal2 = true;
                }
                for (int y = x2 - k; x2 < oldSize && y < newSize && cb.areItemsTheSame(startOld + x2, startNew + y); y++) {
                    x2++;
                }
                forward[kOffset + k] = x2;
                if (checkInFwd && k >= (delta - d) + 1 && k <= (delta + d) - 1 && forward[kOffset + k] >= backward[kOffset + k]) {
                    Snake outSnake = new Snake();
                    outSnake.x = backward[kOffset + k];
                    outSnake.y = outSnake.x - k;
                    outSnake.size = forward[kOffset + k] - backward[kOffset + k];
                    outSnake.removal = removal2;
                    outSnake.reverse = false;
                    return outSnake;
                }
            }
            for (int k2 = -d; k2 <= d; k2 += 2) {
                int backwardK = k2 + delta;
                if (backwardK == d + delta || (backwardK != (-d) + delta && backward[(kOffset + backwardK) - 1] < backward[kOffset + backwardK + 1])) {
                    x = backward[(kOffset + backwardK) - 1];
                    removal = false;
                } else {
                    x = backward[(kOffset + backwardK) + 1] - 1;
                    removal = true;
                }
                for (int y2 = x - backwardK; x > 0 && y2 > 0 && cb.areItemsTheSame((startOld + x) - 1, (startNew + y2) - 1); y2--) {
                    x--;
                }
                backward[kOffset + backwardK] = x;
                if (!checkInFwd && k2 + delta >= (-d) && k2 + delta <= d && forward[kOffset + backwardK] >= backward[kOffset + backwardK]) {
                    Snake outSnake2 = new Snake();
                    outSnake2.x = backward[kOffset + backwardK];
                    outSnake2.y = outSnake2.x - backwardK;
                    outSnake2.size = forward[kOffset + backwardK] - backward[kOffset + backwardK];
                    outSnake2.removal = removal;
                    outSnake2.reverse = true;
                    return outSnake2;
                }
            }
        }
        throw new IllegalStateException("DiffUtil hit an unexpected case while trying to calculate the optimal path. Please make sure your data is not changing during the diff calculation.");
    }

    /* loaded from: classes.dex */
    public static abstract class Callback {
        public abstract boolean areContentsTheSame(int i, int i2);

        public abstract boolean areItemsTheSame(int i, int i2);

        public abstract int getNewListSize();

        public abstract int getOldListSize();

        @Nullable
        public Object getChangePayload(int oldItemPosition, int newItemPosition) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class Snake {
        boolean removal;
        boolean reverse;
        int size;
        int x;
        int y;

        Snake() {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class Range {
        int newListEnd;
        int newListStart;
        int oldListEnd;
        int oldListStart;

        public Range() {
        }

        public Range(int oldListStart, int oldListEnd, int newListStart, int newListEnd) {
            this.oldListStart = oldListStart;
            this.oldListEnd = oldListEnd;
            this.newListStart = newListStart;
            this.newListEnd = newListEnd;
        }
    }

    /* loaded from: classes.dex */
    public static class DiffResult {
        private static final int FLAG_CHANGED = 2;
        private static final int FLAG_IGNORE = 16;
        private static final int FLAG_MASK = 31;
        private static final int FLAG_MOVED_CHANGED = 4;
        private static final int FLAG_MOVED_NOT_CHANGED = 8;
        private static final int FLAG_NOT_CHANGED = 1;
        private static final int FLAG_OFFSET = 5;
        private final Callback mCallback;
        private final boolean mDetectMoves;
        private final int[] mNewItemStatuses;
        private final int mNewListSize;
        private final int[] mOldItemStatuses;
        private final int mOldListSize;
        private final List<Snake> mSnakes;

        DiffResult(Callback callback, List<Snake> snakes, int[] oldItemStatuses, int[] newItemStatuses, boolean detectMoves) {
            this.mSnakes = snakes;
            this.mOldItemStatuses = oldItemStatuses;
            this.mNewItemStatuses = newItemStatuses;
            Arrays.fill(this.mOldItemStatuses, 0);
            Arrays.fill(this.mNewItemStatuses, 0);
            this.mCallback = callback;
            this.mOldListSize = callback.getOldListSize();
            this.mNewListSize = callback.getNewListSize();
            this.mDetectMoves = detectMoves;
            addRootSnake();
            findMatchingItems();
        }

        private void addRootSnake() {
            Snake firstSnake = this.mSnakes.isEmpty() ? null : this.mSnakes.get(0);
            if (firstSnake == null || firstSnake.x != 0 || firstSnake.y != 0) {
                Snake root = new Snake();
                root.x = 0;
                root.y = 0;
                root.removal = false;
                root.size = 0;
                root.reverse = false;
                this.mSnakes.add(0, root);
            }
        }

        private void findMatchingItems() {
            int posOld = this.mOldListSize;
            int posNew = this.mNewListSize;
            for (int i = this.mSnakes.size() - 1; i >= 0; i--) {
                Snake snake = this.mSnakes.get(i);
                int endX = snake.x + snake.size;
                int endY = snake.y + snake.size;
                if (this.mDetectMoves) {
                    while (posOld > endX) {
                        findAddition(posOld, posNew, i);
                        posOld--;
                    }
                    while (posNew > endY) {
                        findRemoval(posOld, posNew, i);
                        posNew--;
                    }
                }
                for (int j = 0; j < snake.size; j++) {
                    int oldItemPos = snake.x + j;
                    int newItemPos = snake.y + j;
                    boolean theSame = this.mCallback.areContentsTheSame(oldItemPos, newItemPos);
                    int changeFlag = theSame ? 1 : 2;
                    this.mOldItemStatuses[oldItemPos] = (newItemPos << 5) | changeFlag;
                    this.mNewItemStatuses[newItemPos] = (oldItemPos << 5) | changeFlag;
                }
                posOld = snake.x;
                posNew = snake.y;
            }
        }

        private void findAddition(int x, int y, int snakeIndex) {
            if (this.mOldItemStatuses[x - 1] == 0) {
                findMatchingItem(x, y, snakeIndex, false);
            }
        }

        private void findRemoval(int x, int y, int snakeIndex) {
            if (this.mNewItemStatuses[y - 1] == 0) {
                findMatchingItem(x, y, snakeIndex, true);
            }
        }

        private boolean findMatchingItem(int x, int y, int snakeIndex, boolean removal) {
            int myItemPos;
            int curX;
            int curY;
            if (removal) {
                myItemPos = y - 1;
                curX = x;
                curY = y - 1;
            } else {
                myItemPos = x - 1;
                curX = x - 1;
                curY = y;
            }
            for (int i = snakeIndex; i >= 0; i--) {
                Snake snake = this.mSnakes.get(i);
                int endX = snake.x + snake.size;
                int endY = snake.y + snake.size;
                if (removal) {
                    for (int pos = curX - 1; pos >= endX; pos--) {
                        if (this.mCallback.areItemsTheSame(pos, myItemPos)) {
                            boolean theSame = this.mCallback.areContentsTheSame(pos, myItemPos);
                            int changeFlag = theSame ? 8 : 4;
                            this.mNewItemStatuses[myItemPos] = (pos << 5) | 16;
                            this.mOldItemStatuses[pos] = (myItemPos << 5) | changeFlag;
                            return true;
                        }
                    }
                    continue;
                } else {
                    for (int pos2 = curY - 1; pos2 >= endY; pos2--) {
                        if (this.mCallback.areItemsTheSame(myItemPos, pos2)) {
                            boolean theSame2 = this.mCallback.areContentsTheSame(myItemPos, pos2);
                            int changeFlag2 = theSame2 ? 8 : 4;
                            this.mOldItemStatuses[x - 1] = (pos2 << 5) | 16;
                            this.mNewItemStatuses[pos2] = ((x - 1) << 5) | changeFlag2;
                            return true;
                        }
                    }
                    continue;
                }
                curX = snake.x;
                curY = snake.y;
            }
            return false;
        }

        public void dispatchUpdatesTo(final RecyclerView.Adapter adapter) {
            dispatchUpdatesTo(new ListUpdateCallback() { // from class: android.support.v7.util.DiffUtil.DiffResult.1
                @Override // android.support.v7.util.ListUpdateCallback
                public void onInserted(int position, int count) {
                    adapter.notifyItemRangeInserted(position, count);
                }

                @Override // android.support.v7.util.ListUpdateCallback
                public void onRemoved(int position, int count) {
                    adapter.notifyItemRangeRemoved(position, count);
                }

                @Override // android.support.v7.util.ListUpdateCallback
                public void onMoved(int fromPosition, int toPosition) {
                    adapter.notifyItemMoved(fromPosition, toPosition);
                }

                @Override // android.support.v7.util.ListUpdateCallback
                public void onChanged(int position, int count, Object payload) {
                    adapter.notifyItemRangeChanged(position, count, payload);
                }
            });
        }

        public void dispatchUpdatesTo(ListUpdateCallback updateCallback) {
            BatchingListUpdateCallback batchingCallback;
            if (updateCallback instanceof BatchingListUpdateCallback) {
                batchingCallback = (BatchingListUpdateCallback) updateCallback;
            } else {
                batchingCallback = new BatchingListUpdateCallback(updateCallback);
            }
            List<PostponedUpdate> postponedUpdates = new ArrayList<>();
            int posOld = this.mOldListSize;
            int posNew = this.mNewListSize;
            for (int snakeIndex = this.mSnakes.size() - 1; snakeIndex >= 0; snakeIndex--) {
                Snake snake = this.mSnakes.get(snakeIndex);
                int snakeSize = snake.size;
                int endX = snake.x + snakeSize;
                int endY = snake.y + snakeSize;
                if (endX < posOld) {
                    dispatchRemovals(postponedUpdates, batchingCallback, endX, posOld - endX, endX);
                }
                if (endY < posNew) {
                    dispatchAdditions(postponedUpdates, batchingCallback, endX, posNew - endY, endY);
                }
                for (int i = snakeSize - 1; i >= 0; i--) {
                    if ((this.mOldItemStatuses[snake.x + i] & 31) == 2) {
                        batchingCallback.onChanged(snake.x + i, 1, this.mCallback.getChangePayload(snake.x + i, snake.y + i));
                    }
                }
                posOld = snake.x;
                posNew = snake.y;
            }
            batchingCallback.dispatchLastEvent();
        }

        private static PostponedUpdate removePostponedUpdate(List<PostponedUpdate> updates, int pos, boolean removal) {
            for (int i = updates.size() - 1; i >= 0; i--) {
                PostponedUpdate update = updates.get(i);
                if (update.posInOwnerList == pos && update.removal == removal) {
                    updates.remove(i);
                    for (int j = i; j < updates.size(); j++) {
                        PostponedUpdate postponedUpdate = updates.get(j);
                        postponedUpdate.currentPos = (removal ? 1 : -1) + postponedUpdate.currentPos;
                    }
                    return update;
                }
            }
            return null;
        }

        private void dispatchAdditions(List<PostponedUpdate> postponedUpdates, ListUpdateCallback updateCallback, int start, int count, int globalIndex) {
            if (!this.mDetectMoves) {
                updateCallback.onInserted(start, count);
                return;
            }
            for (int i = count - 1; i >= 0; i--) {
                int status = this.mNewItemStatuses[globalIndex + i] & 31;
                switch (status) {
                    case 0:
                        updateCallback.onInserted(start, 1);
                        for (PostponedUpdate update : postponedUpdates) {
                            update.currentPos++;
                        }
                        break;
                    case 4:
                    case 8:
                        int pos = this.mNewItemStatuses[globalIndex + i] >> 5;
                        updateCallback.onMoved(removePostponedUpdate(postponedUpdates, pos, true).currentPos, start);
                        if (status == 4) {
                            updateCallback.onChanged(start, 1, this.mCallback.getChangePayload(pos, globalIndex + i));
                            break;
                        } else {
                            break;
                        }
                    case 16:
                        postponedUpdates.add(new PostponedUpdate(globalIndex + i, start, false));
                        break;
                    default:
                        throw new IllegalStateException("unknown flag for pos " + (globalIndex + i) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + Long.toBinaryString(status));
                }
            }
        }

        private void dispatchRemovals(List<PostponedUpdate> postponedUpdates, ListUpdateCallback updateCallback, int start, int count, int globalIndex) {
            if (!this.mDetectMoves) {
                updateCallback.onRemoved(start, count);
                return;
            }
            for (int i = count - 1; i >= 0; i--) {
                int status = this.mOldItemStatuses[globalIndex + i] & 31;
                switch (status) {
                    case 0:
                        updateCallback.onRemoved(start + i, 1);
                        for (PostponedUpdate update : postponedUpdates) {
                            update.currentPos--;
                        }
                        break;
                    case 4:
                    case 8:
                        int pos = this.mOldItemStatuses[globalIndex + i] >> 5;
                        PostponedUpdate update2 = removePostponedUpdate(postponedUpdates, pos, false);
                        updateCallback.onMoved(start + i, update2.currentPos - 1);
                        if (status == 4) {
                            updateCallback.onChanged(update2.currentPos - 1, 1, this.mCallback.getChangePayload(globalIndex + i, pos));
                            break;
                        } else {
                            break;
                        }
                    case 16:
                        postponedUpdates.add(new PostponedUpdate(globalIndex + i, start + i, true));
                        break;
                    default:
                        throw new IllegalStateException("unknown flag for pos " + (globalIndex + i) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + Long.toBinaryString(status));
                }
            }
        }

        @VisibleForTesting
        List<Snake> getSnakes() {
            return this.mSnakes;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class PostponedUpdate {
        int currentPos;
        int posInOwnerList;
        boolean removal;

        public PostponedUpdate(int posInOwnerList, int currentPos, boolean removal) {
            this.posInOwnerList = posInOwnerList;
            this.currentPos = currentPos;
            this.removal = removal;
        }
    }
}
