.class Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;
.super Landroid/widget/BaseAdapter;
.source "NewPostFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showOptions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

.field final synthetic val$enabled:[Z

.field final synthetic val$wrapped:Landroid/widget/ArrayAdapter;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Landroid/widget/ArrayAdapter;[Z)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    .prologue
    .line 1188
    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;->val$wrapped:Landroid/widget/ArrayAdapter;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;->val$enabled:[Z

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 1192
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;->val$wrapped:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1197
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;->val$wrapped:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 1202
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;->val$wrapped:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0, p1}, Landroid/widget/ArrayAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1207
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;->val$wrapped:Landroid/widget/ArrayAdapter;

    invoke-virtual {v1, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1208
    .local v0, "view":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;->val$enabled:[Z

    aget-boolean v1, v1, p1

    if-nez v1, :cond_0

    .line 1209
    const v1, 0x3e99999a    # 0.3f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 1213
    :goto_0
    return-object v0

    .line 1211
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0
.end method
