.class public Lru/mail/libverify/utils/permissions/ShadowActivity;
.super Landroid/app/Activity;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x17
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/utils/permissions/ShadowActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "permissions"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lru/mail/libverify/utils/permissions/ShadowActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "request_id"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lru/mail/libverify/utils/permissions/ShadowActivity;->requestPermissions([Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0
    .param p2    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1, p2, p3}, Lru/mail/libverify/utils/permissions/a;->a(I[Ljava/lang/String;[I)V

    invoke-virtual {p0}, Lru/mail/libverify/utils/permissions/ShadowActivity;->finish()V

    return-void
.end method
