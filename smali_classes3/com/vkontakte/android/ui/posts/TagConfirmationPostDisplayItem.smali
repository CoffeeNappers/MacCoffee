.class public Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "TagConfirmationPostDisplayItem.java"


# instance fields
.field private onRemove:Ljava/lang/Runnable;

.field private profile:Lcom/vkontakte/android/UserProfile;

.field private tagID:I


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/UserProfile;ILjava/lang/Runnable;)V
    .locals 0
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "profile"    # Lcom/vkontakte/android/UserProfile;
    .param p3, "tagID"    # I
    .param p4, "removeThisItem"    # Ljava/lang/Runnable;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 35
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->profile:Lcom/vkontakte/android/UserProfile;

    .line 36
    iput p3, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->tagID:I

    .line 37
    iput-object p4, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->onRemove:Ljava/lang/Runnable;

    .line 38
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->broadcastRemoval(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;

    .prologue
    .line 27
    iget v0, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->tagID:I

    return v0
.end method

.method private broadcastRemoval(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 95
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->onRemove:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 96
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.PHOTO_REMOVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 97
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "aid"

    const/16 v2, -0x2328

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 98
    const-string/jumbo v1, "pid"

    iget v2, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->postID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 99
    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 108
    const v0, 0x7f0301b5

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static decreasePhotosCounter()V
    .locals 1

    .prologue
    .line 90
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumPhotosMarks()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Lcom/vkontakte/android/LongPollService;->setNumPhotosMarks(I)V

    .line 91
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->notifyCountersChanged()V

    .line 92
    return-void
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 42
    const/16 v0, 0x10

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v7, 0x0

    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v2, v2, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v2, :cond_0

    const v2, 0x7f080744

    :goto_0
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "[id"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->profile:Lcom/vkontakte/android/UserProfile;

    iget v6, v6, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "|"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-virtual {v3, v2, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Landroid/text/Spannable;

    .line 53
    .local v1, "ss":Landroid/text/Spannable;
    invoke-interface {v1}, Landroid/text/Spannable;->length()I

    move-result v2

    const-class v3, Lcom/vkontakte/android/LinkSpan;

    invoke-interface {v1, v7, v2, v3}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/LinkSpan;

    .line 54
    .local v0, "spans":[Lcom/vkontakte/android/LinkSpan;
    new-instance v2, Lcom/vkontakte/android/ui/Font$TypefaceSpan;

    sget-object v3, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/ui/Font$TypefaceSpan;-><init>(Lcom/vkontakte/android/ui/Font;)V

    aget-object v3, v0, v7

    invoke-interface {v1, v3}, Landroid/text/Spannable;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    aget-object v4, v0, v7

    invoke-interface {v1, v4}, Landroid/text/Spannable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v4

    invoke-interface {v1, v2, v3, v4, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 55
    const v2, 0x7f1001c3

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    const v2, 0x7f1004c5

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$1;-><init>(Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    const v2, 0x7f1004c6

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2;-><init>(Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    const v2, 0x7f1001e8

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->getImageURL(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 87
    return-void

    .line 52
    .end local v0    # "spans":[Lcom/vkontakte/android/LinkSpan;
    .end local v1    # "ss":Landroid/text/Spannable;
    :cond_0
    const v2, 0x7f080745

    goto/16 :goto_0
.end method
