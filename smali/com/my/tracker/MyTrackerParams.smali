.class public final Lcom/my/tracker/MyTrackerParams;
.super Ljava/lang/Object;
.source "MyTrackerParams.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/tracker/MyTrackerParams$Gender;
    }
.end annotation


# instance fields
.field private final internalParams:Lcom/my/tracker/b;


# direct methods
.method constructor <init>(Lcom/my/tracker/b;)V
    .locals 0

    .prologue
    .line 261
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 262
    iput-object p1, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    .line 263
    return-void
.end method


# virtual methods
.method public final getAge()I
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->a()I

    move-result v0

    return v0
.end method

.method public final getCustomUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->b()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getCustomUserIds()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->c()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->d()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getEmails()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->e()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getGender()I
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->f()I

    move-result v0

    return v0
.end method

.method public final getIcqId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->g()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getIcqIds()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->h()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->i()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getLang()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->j()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getLaunchTimeout()I
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->k()I

    move-result v0

    return v0
.end method

.method public final getMrgsAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->l()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getMrgsId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->m()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getMrgsUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->n()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getOkId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->o()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getOkIds()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->p()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getVKId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->q()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getVKIds()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->r()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getVendorAppPackage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->s()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final isTrackingAppsEnabled()Z
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->t()Z

    move-result v0

    return v0
.end method

.method public final isTrackingEnvironmentEnabled()Z
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->u()Z

    move-result v0

    return v0
.end method

.method public final isTrackingLaunchEnabled()Z
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->v()Z

    move-result v0

    return v0
.end method

.method public final isTrackingLocationEnabled()Z
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->w()Z

    move-result v0

    return v0
.end method

.method public final setAge(I)V
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->a(I)V

    .line 145
    return-void
.end method

.method public final setCustomUserId(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->a(Ljava/lang/String;)V

    .line 150
    return-void
.end method

.method public final setCustomUserIds([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->a([Ljava/lang/String;)V

    .line 155
    return-void
.end method

.method public final setDefaultVendorAppPackage()V
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->x()V

    .line 160
    return-void
.end method

.method public final setEmail(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->b(Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public final setEmails([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->b([Ljava/lang/String;)V

    .line 170
    return-void
.end method

.method public final setGender(I)V
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->b(I)V

    .line 175
    return-void
.end method

.method public final setIcqId(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->c(Ljava/lang/String;)V

    .line 180
    return-void
.end method

.method public final setIcqIds([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->c([Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method public final setLang(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->d(Ljava/lang/String;)V

    .line 190
    return-void
.end method

.method public final setLaunchTimeout(I)V
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->c(I)V

    .line 195
    return-void
.end method

.method public final setMrgsAppId(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->e(Ljava/lang/String;)V

    .line 200
    return-void
.end method

.method public final setMrgsId(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->f(Ljava/lang/String;)V

    .line 205
    return-void
.end method

.method public final setMrgsUserId(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->g(Ljava/lang/String;)V

    .line 210
    return-void
.end method

.method public final setOkId(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->h(Ljava/lang/String;)V

    .line 215
    return-void
.end method

.method public final setOkIds([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->d([Ljava/lang/String;)V

    .line 220
    return-void
.end method

.method public final setTrackingAppsEnabled(Z)V
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->a(Z)V

    .line 225
    return-void
.end method

.method public final setTrackingEnvironmentEnabled(Z)V
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->b(Z)V

    .line 230
    return-void
.end method

.method public final setTrackingLaunchEnabled(Z)V
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->c(Z)V

    .line 235
    return-void
.end method

.method public final setTrackingLocationEnabled(Z)V
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->d(Z)V

    .line 240
    return-void
.end method

.method public final setVKId(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 244
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->i(Ljava/lang/String;)V

    .line 245
    return-void
.end method

.method public final setVKIds([Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->e([Ljava/lang/String;)V

    .line 250
    return-void
.end method

.method public final setVendorAppPackage(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 254
    iget-object v0, p0, Lcom/my/tracker/MyTrackerParams;->internalParams:Lcom/my/tracker/b;

    invoke-virtual {v0, p1}, Lcom/my/tracker/b;->j(Ljava/lang/String;)V

    .line 255
    return-void
.end method
