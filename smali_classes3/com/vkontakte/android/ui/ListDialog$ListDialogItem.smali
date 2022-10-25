.class public Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;
.super Ljava/lang/Object;
.source "ListDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/ListDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ListDialogItem"
.end annotation


# instance fields
.field final defaultIcon:I

.field final icon:Ljava/lang/Object;

.field final id:I

.field final textColor:I

.field final title:Ljava/lang/Object;

.field final type:I


# direct methods
.method public constructor <init>(IILjava/lang/Object;ILjava/lang/Object;I)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "id"    # I
    .param p3, "title"    # Ljava/lang/Object;
    .param p4, "textColor"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .param p5, "icon"    # Ljava/lang/Object;
    .param p6, "defaultIcon"    # I

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput p1, p0, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;->type:I

    .line 63
    iput p2, p0, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;->id:I

    .line 64
    iput-object p3, p0, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;->title:Ljava/lang/Object;

    .line 65
    iput-object p5, p0, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;->icon:Ljava/lang/Object;

    .line 66
    iput p4, p0, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;->textColor:I

    .line 67
    iput p6, p0, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;->defaultIcon:I

    .line 68
    return-void
.end method

.method public constructor <init>(ILjava/lang/Object;Ljava/lang/Object;)V
    .locals 7
    .param p1, "id"    # I
    .param p2, "title"    # Ljava/lang/Object;
    .param p3, "icon"    # Ljava/lang/Object;

    .prologue
    .line 71
    const/4 v1, 0x1

    const v4, 0x7f0f0073

    const/4 v6, 0x0

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;-><init>(IILjava/lang/Object;ILjava/lang/Object;I)V

    .line 72
    return-void
.end method
