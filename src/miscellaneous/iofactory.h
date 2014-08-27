// This file is part of RSS Guard.
//
// Copyright (C) 2011-2014 by Martin Rotter <rotter.martinos@gmail.com>
//
// RSS Guard is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// RSS Guard is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with RSS Guard. If not, see <http://www.gnu.org/licenses/>.

#ifndef IOFACTORY_H
#define IOFACTORY_H

#include <QStringList>


class IOFactory {
  private:
    IOFactory();

  public:
    // Copy whole directory recursively.
    // Destination path is created if it does not exist.
    static bool copyDirectory(QString source, QString destination);

    // Removes directory recursively and skips given folders/files.
    static bool removeDirectory(const QString &directory_name,
                                const QStringList &exception_file_list = QStringList(),
                                const QStringList &exception_folder_list = QStringList());
};

#endif // IOFACTORY_H
