.class Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$3;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "AutoSuggestStickersPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;->initializePopupWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

.field final synthetic val$paddingLeftRight:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$3;->this$0:Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow;

    iput p2, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$3;->val$paddingLeftRight:I

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 2
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v1, 0x0

    .line 168
    iget v0, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$3;->val$paddingLeftRight:I

    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 169
    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 170
    iget v0, p0, Lcom/vkontakte/android/stickers/AutoSuggestStickersPopupWindow$3;->val$paddingLeftRight:I

    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 171
    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 172
    return-void
.end method
