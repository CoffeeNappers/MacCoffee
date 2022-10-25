.class final Lru/mail/libverify/notifications/SettingsActivity$a$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/notifications/SettingsActivity$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/notifications/SettingsActivity$a;


# direct methods
.method constructor <init>(Lru/mail/libverify/notifications/SettingsActivity$a;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/notifications/SettingsActivity$a$3;->a:Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a$3;->a:Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-static {v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->b(Lru/mail/libverify/notifications/SettingsActivity$a;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/notifications/SettingsActivity$a$3;->a:Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-virtual {v0}, Lru/mail/libverify/notifications/SettingsActivity$a;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/api/k;->e(Landroid/content/Context;)Lru/mail/libverify/api/ac;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/notifications/SettingsActivity$a$3;->a:Lru/mail/libverify/notifications/SettingsActivity$a;

    invoke-static {v1}, Lru/mail/libverify/notifications/SettingsActivity$a;->c(Lru/mail/libverify/notifications/SettingsActivity$a;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/ac;->j(Ljava/lang/String;)V

    goto :goto_0
.end method
